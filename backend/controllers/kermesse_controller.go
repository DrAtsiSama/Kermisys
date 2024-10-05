package controllers

import (
	"log"
	"net/http"
	"strconv"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Créer une nouvelle kermesse
// @Description  Crée une nouvelle kermesse avec les détails fournis
// @Tags         Kermesses
// @Accept       json
// @Produce      json
// @Param        kermesse  body  models.Kermesse  true  "Détails de la kermesse"
// @Success      201  {object}  models.Kermesse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /kermesses [post]
// @Security Bearer
func CreateKermesse(c *gin.Context) {
	var kermesse models.Kermesse
	if err := c.ShouldBindJSON(&kermesse); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid data"})
		return
	}

	// Récupérer l'ID utilisateur depuis le JWT (middleware JWT doit être configuré pour ajouter l'ID utilisateur)
	userID, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Impossible de récupérer l'ID utilisateur depuis le token"})
		return
	}

	// Vérifier si l'utilisateur existe
	var user models.User
	log.Println(user, userID)
	if err := database.DB.First(&user, userID).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Utilisateur non trouvé"})
		return
	}

	// Définir les timestamps pour la nouvelle kermesse
	kermesse.CreatedAt = time.Now()
	kermesse.UpdatedAt = time.Now()

	// Ajouter l'utilisateur en tant qu'organisateur de la kermesse
	kermesse.Organisateurs = append(kermesse.Organisateurs, user)

	// Créer la kermesse dans la base de données
	if err := services.CreateKermesse(kermesse, user.ID); err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to create kermesse"})
		return
	}

	c.JSON(http.StatusCreated, kermesse)
}

// @Summary      Récupérer toutes les kermesses
// @Description  Récupère la liste de toutes les kermesses avec pagination et filtres
// @Tags         Kermesses
// @Produce      json
// @Param        page     query     int     false  "Numéro de la page"
// @Param        limit    query     int     false  "Nombre d'éléments par page"
// @Param        name     query     string  false  "Filtrer par nom de la kermesse"
// @Param        location query     string  false  "Filtrer par localisation de la kermesse"
// @Param        startDate query    string  false  "Filtrer par date de début (format: YYYY-MM-DD)"
// @Success      200      {array}   models.Kermesse
// @Failure      500      {object}  models.ErrorResponse
// @Router       /kermesses [get]
// @Security Bearer
func GetAllKermesses(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "10"))
	offset := (page - 1) * limit

	name := c.Query("name")
	location := c.Query("location")
	startDate := c.Query("startDate")

	var kermesses []models.Kermesse
	query := database.DB.Offset(offset).Limit(limit)

	if name != "" {
		query = query.Where("name ILIKE ?", "%"+name+"%")
	}
	if location != "" {
		query = query.Where("location ILIKE ?", "%"+location+"%")
	}
	if startDate != "" {
		parsedDate, err := time.Parse("2006-01-02", startDate)
		if err == nil {
			query = query.Where("start_date = ?", parsedDate)
		}
	}

	if err := query.Find(&kermesses).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to fetch kermesses"})
		return
	}

	c.JSON(http.StatusOK, kermesses)
}

// @Summary      Récupérer une kermesse par ID
// @Description  Récupère les détails d'une kermesse par son ID
// @Tags         Kermesses
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Success      200  {object}  models.Kermesse
// @Failure      404  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id} [get]
// @Security Bearer
func GetKermesseByID(c *gin.Context) {
	id := c.Param("kermesse_id")
	var kermesse models.Kermesse
	if err := database.DB.First(&kermesse, id).Error; err != nil {
		if err.Error() == "record not found" {
			c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Kermesse not found"})
		} else {
			c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Error fetching kermesse"})
		}
		return
	}
	c.JSON(http.StatusOK, kermesse)
}

// @Summary      Mettre à jour une kermesse
// @Description  Met à jour les détails d'une kermesse existante
// @Tags         Kermesses
// @Accept       json
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Param        kermesse     body  models.Kermesse  true  "Détails mis à jour de la kermesse"
// @Success      200  {object}  models.Kermesse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      404  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id} [put]
// @Security Bearer
func UpdateKermesse(c *gin.Context) {
	id := c.Param("kermesse_id")
	var kermesse models.Kermesse
	if err := database.DB.First(&kermesse, id).Error; err != nil {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Kermesse not found"})
		return
	}

	if err := c.ShouldBindJSON(&kermesse); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid data"})
		return
	}
	kermesse.UpdatedAt = time.Now()

	if err := database.DB.Save(&kermesse).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to update kermesse"})
		return
	}
	c.JSON(http.StatusOK, kermesse)
}

// @Summary      Supprimer une kermesse
// @Description  Supprime une kermesse par son ID
// @Tags         Kermesses
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Success      204
// @Failure      404  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id} [delete]
// @Security Bearer
func DeleteKermesse(c *gin.Context) {
	id := c.Param("kermesse_id")
	if err := database.DB.Delete(&models.Kermesse{}, id).Error; err != nil {
		if err.Error() == "record not found" {
			c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Kermesse not found"})
		} else {
			c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to delete kermesse"})
		}
		return
	}
	c.Status(http.StatusNoContent)
}

// @Summary      Ajouter un participant à une kermesse
// @Description  Ajoute un utilisateur en tant que participant à une kermesse
// @Tags         Kermesses
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Param        user_id      path  int  true  "ID de l'utilisateur"
// @Success      200  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id}/participants/{user_id} [post]
// @Security Bearer
func AddParticipantToKermesse(c *gin.Context) {
	kermesseID, _ := strconv.Atoi(c.Param("kermesse_id"))
	userID, _ := strconv.Atoi(c.Param("user_id"))
	err := services.AddParticipant(uint(kermesseID), uint(userID))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Participant ajouté avec succès"})
}

// @Summary      Ajouter un stand à une kermesse
// @Description  Ajoute un stand à une kermesse
// @Tags         Kermesses
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Param        stand_id     path  int  true  "ID du stand"
// @Success      200  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id}/stands/{stand_id} [post]
// @Security Bearer
func AddStandToKermesse(c *gin.Context) {
	kermesseID, _ := strconv.Atoi(c.Param("kermesse_id"))
	standID, _ := strconv.Atoi(c.Param("stand_id"))
	err := services.AddStand(uint(kermesseID), uint(standID))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Stand ajouté avec succès"})
}

// @Summary      Rejoindre une kermesse
// @Description  Permet à un utilisateur de rejoindre une kermesse
// @Tags         Kermesses
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Success      200  {string}  string  "Inscription réussie"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /kermesses/join/{kermesse_id} [post]
// @Security Bearer
func JoinKermesseHandler(c *gin.Context) {
	kermesseID, err := strconv.Atoi(c.Param("kermesse_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid kermesse ID"})
		return
	}

	// Récupérer l'ID utilisateur depuis le JWT
	userID := c.MustGet("userID").(uint)

	err = services.JoinKermesse(uint(kermesseID), userID)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Inscription réussie"})
}

// @Summary      Quitter une kermesse
// @Description  Permet à un utilisateur de quitter une kermesse
// @Tags         Kermesses
// @Produce      json
// @Param        kermesse_id  path  int  true  "ID de la kermesse"
// @Success      200  {string}  string  "Désinscription réussie"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /kermesses/leave/{kermesse_id} [post]
// @Security Bearer
func LeaveKermesseHandler(c *gin.Context) {
	kermesseID, err := strconv.Atoi(c.Param("kermesse_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid kermesse ID"})
		return
	}

	// Récupérer l'ID utilisateur depuis le JWT
	userID := c.MustGet("userID").(uint)

	err = services.LeaveKermesse(uint(kermesseID), userID)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Désinscription réussie"})
}

// @Summary      Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand
// @Description  Permet à un organisateur ou admin d'ajouter ou de mettre à jour le score d'un utilisateur pour un stand spécifique
// @Tags         Stands
// @Accept       json
// @Produce      json
// @Param        kermesse_id  path      int              true  "ID de la kermesse"
// @Param        stand_id     path      int              true  "ID du stand"
// @Param        user_id      path      int              true  "ID de l'utilisateur"
// @Param        score        body      models.ScoreRequest  true  "Score à ajouter"
// @Success      200  {string}  string  "Score ajouté ou mis à jour avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id} [post]
// @Security Bearer
func AddOrUpdatePlayerScore(c *gin.Context) {
	kermesseID, err := strconv.Atoi(c.Param("kermesse_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid kermesse ID"})
		return
	}

	standID, err := strconv.Atoi(c.Param("stand_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	userID, err := strconv.Atoi(c.Param("user_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	// Vérifier que la kermesse et le stand existent
	if !services.DoesKermesseExist(uint(kermesseID)) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Kermesse not found"})
		return
	}

	if !services.DoesStandExist(uint(standID)) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Stand not found"})
		return
	}

	// Vérifier que l'utilisateur est un participant de la kermesse
	if !services.IsParticipantOfKermesse(uint(kermesseID), uint(userID)) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "User is not a participant of the kermesse"})
		return
	}

	// Récupérer le score à partir du corps de la requête
	var scoreRequest models.ScoreRequest
	if err := c.ShouldBindJSON(&scoreRequest); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid score data"})
		return
	}

	// Ajouter ou mettre à jour le score
	if err := services.AddOrUpdatePlayerScore(uint(kermesseID), uint(standID), uint(userID), scoreRequest.Score); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Score ajouté ou mis à jour avec succès"})
}

// @Summary      Supprimer un score pour un utilisateur et un stand
// @Description  Permet à un gérant de stand ou organisateur de supprimer le score d'un utilisateur pour un stand spécifique d'une kermesse
// @Tags         Stands
// @Param        kermesse_id  path      int     true  "ID de la kermesse"
// @Param        stand_id     path      int     true  "ID du stand"
// @Param        user_id      path      int     true  "ID de l'utilisateur"
// @Success      200  {string}  string  "Score supprimé avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id} [delete]
// @Security Bearer
func RemovePlayerScore(c *gin.Context) {
	kermesseID, err := strconv.Atoi(c.Param("kermesse_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid kermesse ID"})
		return
	}

	standID, err := strconv.Atoi(c.Param("stand_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	// Récupérer l'ID de l'utilisateur à partir du paramètre de la requête
	userID, err := strconv.Atoi(c.Param("user_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	// Supprimer le score
	if err := services.RemovePlayerScore(uint(kermesseID), uint(standID), uint(userID)); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Score supprimé avec succès"})
}
