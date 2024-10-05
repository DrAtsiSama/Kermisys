package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// WinnerResponse structure pour retourner le gagnant et le lot
type WinnerResponse struct {
	Winner string     `json:"winner"`
	Lot    models.Lot `json:"lot"`
}

// @Summary      Créer une tombola
// @Description  Crée une nouvelle tombola (réservé aux organisateurs ou aux admins)
// @Tags         Tombolas
// @Produce      json
// @Param        kermesse_id  path  uint  true  "ID de la kermesse"
// @Success      201  {object}  models.Tombola
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/create/{kermesse_id} [post]
// @Security Bearer
func CreateTombola(c *gin.Context) {
	userID := c.GetUint("userID")
	role := c.GetString("role")

	// Récupérer l'ID de la kermesse à partir des paramètres de l'URL
	kermesseID, err := strconv.ParseUint(c.Param("kermesse_id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid kermesse ID"})
		return
	}

	// Vérifier si l'utilisateur est un organisateur de la kermesse ou admin
	if role != "admin" && !services.IsOrganisateur(uint(kermesseID), userID) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Accès non autorisé"})
		return
	}

	// Créer la tombola
	tombola, err := services.CreateTombola(userID, uint(kermesseID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusCreated, tombola)
}

// @Summary      Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)
// @Description  Modifie une tombola existante (réservé aux organisateurs ou admins)
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Param        tombola     body  models.Tombola  true  "Nouveaux détails de la tombola (nom et KermesseID)"
// @Success      200  {object}  models.Tombola
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/edit [put]
// @Security Bearer
func UpdateTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	var updatedTombola models.Tombola
	if err := c.ShouldBindJSON(&updatedTombola); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid data"})
		return
	}

	// Vérifier si l'utilisateur est un organisateur ou admin
	userID := c.GetUint("userID")
	role := c.GetString("role")
	if role != "admin" && !services.IsTombolaOrganisateur(uint(tombolaID), userID) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Accès non autorisé"})
		return
	}

	// Mettre à jour la tombola avec le nom et la KermesseID
	err := services.UpdateTombola(uint(tombolaID), updatedTombola)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de la modification de la tombola"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Tombola mise à jour avec succès"})
}

// @Summary      Supprimer une tombola
// @Description  Supprime une tombola existante (réservé aux organisateurs ou admins)
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Success      200  {string}  string  "Tombola supprimée avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/delete [delete]
// @Security Bearer
func DeleteTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))

	// Vérifier si l'utilisateur est un organisateur ou admin
	userID := c.GetUint("userID")
	role := c.GetString("role")
	if role != "admin" && !services.IsTombolaOrganisateur(uint(tombolaID), userID) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Accès non autorisé"})
		return
	}

	err := services.DeleteTombola(uint(tombolaID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de la suppression de la tombola"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Tombola supprimée avec succès"})
}

// @Summary      Ajouter un lot à une tombola
// @Description  Permet d'ajouter un lot à une tombola (réservé aux organisateurs ou admins)
// @Tags         Tombolas
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Param        lot         body  models.Lot  true  "Lot à ajouter"
// @Success      200  {string}  string  "Lot ajouté avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/lot [post]
// @Security Bearer
func AddLotToTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	var lot models.Lot
	if err := c.ShouldBindJSON(&lot); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid data"})
		return
	}

	// Vérifier si l'utilisateur est un organisateur ou admin
	userID := c.GetUint("userID")
	role := c.GetString("role")
	if role != "admin" && !services.IsTombolaOrganisateur(uint(tombolaID), userID) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Accès non autorisé"})
		return
	}

	err := services.AddLot(uint(tombolaID), lot)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de l'ajout du lot"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Lot ajouté avec succès"})
}

// @Summary      Retirer un lot d'une tombola
// @Description  Permet de retirer un lot d'une tombola (réservé aux organisateurs ou admins)
// @Tags         Tombolas
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Param        lot_id      path  int  true  "ID du lot"
// @Success      200  {string}  string  "Lot retiré avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/lot/{lot_id} [delete]
// @Security Bearer
func RemoveLotFromTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	lotID, _ := strconv.Atoi(c.Param("lot_id"))

	// Vérifier si l'utilisateur est un organisateur ou admin
	userID := c.GetUint("userID")
	role := c.GetString("role")
	if role != "admin" && !services.IsTombolaOrganisateur(uint(tombolaID), userID) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Accès non autorisé"})
		return
	}

	err := services.RemoveLot(uint(tombolaID), uint(lotID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de la suppression du lot"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Lot retiré avec succès"})
}

// @Summary      Afficher une tombola avec ses lots
// @Description  Permet d'afficher une tombola et les lots associés
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Success      200  {object}  models.Tombola
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id} [get]
// @Security Bearer
func GetTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))

	tombola, err := services.GetTombola(uint(tombolaID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de la récupération de la tombola"})
		return
	}

	c.JSON(http.StatusOK, tombola)
}

// @Summary      Tirage au sort d'une tombola
// @Description  Permet de réaliser le tirage au sort d'une tombola et d'annoncer le gagnant
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Success      200  {object}  WinnerResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/draw [post]
// @Security     Bearer
func DrawTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))

	// Récupérer le gagnant et le lot
	winner, lot, err := services.DrawTombola(uint(tombolaID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}

	// Retourner le nom d'utilisateur du gagnant et le lot gagné
	c.JSON(http.StatusOK, WinnerResponse{Winner: winner.Username, Lot: *lot})
}

// @Summary      Acheter un ticket de tombola
// @Description  Permet à un utilisateur d'acheter un ticket de tombola (maximum 1 par kermesse)
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Success      200  {string}  string  "Ticket acheté avec succès"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/buy-ticket [post]
// @Security     Bearer
func BuyTombolaTicket(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	userID := c.GetUint("userID")
	kermesseID := c.GetUint("kermesseID")

	err := services.BuyTombolaTicket(uint(tombolaID), userID, kermesseID)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Ticket acheté avec succès"})
}

// @Summary      Récupérer les lots gagnés par un utilisateur
// @Description  Permet de récupérer la liste des lots gagnés par l'utilisateur pour une tombola donnée
// @Tags         Tombolas
// @Produce      json
// @Param        tombola_id  path  int  true  "ID de la tombola"
// @Success      200  {array}  models.Lot
// @Failure      400  {object}  models.ErrorResponse
// @Router       /tombolas/{tombola_id}/lots-won [get]
// @Security Bearer
func GetUserWonLots(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	userID := c.GetUint("userID")

	var wonLots []models.Lot
	err := database.DB.Joins("JOIN user_won_lots ON user_won_lots.lot_id = lots.id").
		Where("user_won_lots.user_id = ? AND user_won_lots.tombola_id = ?", userID, uint(tombolaID)).
		Find(&wonLots).Error
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Erreur lors de la récupération des lots gagnés"})
		return
	}

	c.JSON(http.StatusOK, wonLots)
}
