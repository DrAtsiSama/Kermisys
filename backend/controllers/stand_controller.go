package controllers

import (
	"net/http"
	"strconv"
	"time"

	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Créer un stand
// @Description  Ajoute un nouveau stand et associe l'utilisateur créateur en tant que propriétaire
// @Tags         Stands
// @Accept       json
// @Produce      json
// @Param        stand  body      models.Stand  true  "Détails du stand (Nom, Description, etc.)"
// @Success      201    {object}  models.Stand
// @Failure      400    {object}  models.ErrorResponse
// @Failure      500    {object}  models.ErrorResponse
// @Router       /stands [post]
// @Security Bearer
func CreateStand(c *gin.Context) {
	var standInput models.Stand

	// Lier les données JSON envoyées par l'utilisateur au modèle Stand
	if err := c.ShouldBindJSON(&standInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
		return
	}

	// Récupérer l'ID de l'utilisateur à partir du token JWT
	userID := c.GetUint("userID")

	// Définir l'utilisateur connecté comme propriétaire du stand
	standInput.OwnerID = userID

	// Ajouter les champs automatiques (horodatages)
	standInput.CreatedAt = time.Now()
	standInput.UpdatedAt = time.Now()

	// Sauvegarder dans la base de données via le service
	if err := services.CreateStand(&standInput); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	// Retourner le stand créé avec le statut 201
	c.JSON(http.StatusCreated, standInput)
}

// @Summary      Récupérer un stand par ID
// @Description  Récupère les détails d'un stand par son ID
// @Tags         Stands
// @Produce      json
// @Param        id   path      int  true  "ID du stand"
// @Success      200  {object}  models.Stand
// @Failure      400  {object}  models.ErrorResponse
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stands/{id} [get]
// @Security Bearer
func GetStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	stand, err := services.GetStand(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Stand not found"})
		return
	}

	c.JSON(http.StatusOK, stand)
}

// @Summary      Mettre à jour un stand
// @Description  Met à jour les détails d'un stand existant
// @Tags         Stands
// @Accept       json
// @Produce      json
// @Param        id     path      int         true  "ID du stand"
// @Param        stand  body      models.Stand  true  "Détails du stand"
// @Success      200    {object}  models.Stand
// @Failure      400    {object}  models.ErrorResponse
// @Failure      404    {object}  models.ErrorResponse
// @Router       /stands/{id} [put]
// @Security Bearer
func UpdateStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	var standInput models.Stand
	if err := c.ShouldBindJSON(&standInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
		return
	}

	standInput.ID = uint(id)
	standInput.UpdatedAt = time.Now()

	if err := services.UpdateStand(&standInput); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, standInput)
}

// @Summary      Supprimer un stand
// @Description  Supprime un stand par son ID
// @Tags         Stands
// @Param        id   path      int  true  "ID du stand"
// @Success      204  {string}  string  "Stand deleted"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /stands/{id} [delete]
// @Security Bearer
func DeleteStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	// Appeler le service pour supprimer le stand
	if err := services.DeleteStand(uint(id)); err != nil {
		if err.Error() == "Stand not found" {
			c.JSON(http.StatusNotFound, gin.H{"error": "Stand not found"})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}
		return
	}

	c.JSON(http.StatusNoContent, nil)
}

// @Summary      Récupérer tous les stands avec pagination
// @Description  Récupère la liste de tous les stands avec pagination
// @Tags         Stands
// @Produce      json
// @Param        page   query     int  false  "Numéro de la page"       default(1)
// @Param        limit  query     int  false  "Nombre d'éléments par page" default(10)
// @Success      200  {array}    models.Stand
// @Failure      500  {object}   models.ErrorResponse
// @Router       /stands [get]
// @Security Bearer
func GetAllStands(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "10"))

	stands, err := services.GetAllStands(page, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, stands)
}

// @Summary      Interagir avec un stand
// @Description  Permet à un utilisateur d'interagir avec un stand spécifique
// @Tags         Stands
// @Param        id       path      int    true  "ID du stand"
// @Param        action   query     string true  "Action effectuée (ex: 'buy_item', 'play_game')"
// @Param        quantity query     int    false "Quantité à affecter (par défaut 1)"
// @Success      200  {string}  string  "Interaction réussie"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /stands/{id}/interact [post]
// @Security Bearer
func InteractWithStand(c *gin.Context) {
	// Récupérer l'ID du stand
	standID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid stand ID"})
		return
	}

	// Récupérer l'ID de l'utilisateur à partir du contexte (stocké sous forme de uint)
	userID, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Utilisateur non authentifié"})
		return
	}

	// Convertir l'ID utilisateur en uint
	userIDUint, ok := userID.(uint)
	if !ok {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Invalid userID type"})
		return
	}

	// Récupérer l'action et la quantité
	action := c.Query("action")
	quantity, _ := strconv.Atoi(c.DefaultQuery("quantity", "1"))

	// Appeler le service d'interaction avec un item vide et score à 0 par défaut
	if err := services.InteractWithStand(userIDUint, uint(standID), action, "", quantity, 0); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Stand interaction successful"})
}

// @Summary      Récupérer le score d'un joueur pour un stand spécifique
// @Description  Retourne le score d'un joueur pour un stand spécifique
// @Tags         Stands
// @Produce      json
// @Param        stand_id  path  int  true  "ID du stand"
// @Param        user_id   path  int  true  "ID de l'utilisateur"
// @Success      200  {object}  models.PlayerScore
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stands/{stand_id}/players/{user_id}/score [get]
// @Security Bearer
func GetPlayerScore(c *gin.Context) {
	standID, err := strconv.Atoi(c.Param("stand_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid stand ID"})
		return
	}

	userID, err := strconv.Atoi(c.Param("user_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid user ID"})
		return
	}

	playerScore, err := services.GetPlayerScore(uint(userID), uint(standID))
	if err != nil {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Score not found"})
		return
	}

	c.JSON(http.StatusOK, playerScore)
}
