package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/models" // Importer les modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Interaction avec un stand
// @Description  Permet à un utilisateur d'interagir avec un stand spécifique (nourriture, boisson, activité, etc.)
// @Tags         Stands
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  header    string  true  "Nom d'utilisateur"
// @Param        stand     formData  string  true  "Type de stand (ex: 'food', 'drink', 'activity')"
// @Success      200  {object}  models.StandInteractionResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /interact-stand [post]
func InteractWithStand(c *gin.Context) {
	username := c.GetString("username")
	stand := c.PostForm("stand")

	err := services.InteractWithStand(username, stand, 1)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, models.StandInteractionResponse{Message: "Stand interaction successful"})
}

// @Summary      Créer un stand
// @Description  Ajoute un nouveau stand
// @Tags         Stands
// @Accept       json
// @Produce      json
// @Param        stand  body      models.Stand  true  "Détails du stand"
// @Success      201    {object}  models.Stand
// @Failure      400    {object}  models.ErrorResponse
// @Router       /stands [post]
func CreateStand(c *gin.Context) {
	var stand models.Stand
	if err := c.ShouldBindJSON(&stand); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid request data"})
		return
	}
	if err := services.CreateStand(&stand); err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusCreated, stand)
}

// @Summary      Récupérer un stand
// @Description  Récupère un stand par son ID
// @Tags         Stands
// @Produce      json
// @Param        id   path      int  true  "ID du stand"
// @Success      200  {object}  models.Stand
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stands/{id} [get]
func GetStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid stand ID"})
		return
	}
	stand, err := services.GetStand(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Stand not found"})
		return
	}
	c.JSON(http.StatusOK, stand)
}

// @Summary      Mettre à jour un stand
// @Description  Met à jour les détails d'un stand
// @Tags         Stands
// @Accept       json
// @Produce      json
// @Param        id     path      int         true  "ID du stand"
// @Param        stand  body      models.Stand  true  "Détails du stand"
// @Success      200    {object}  models.Stand
// @Failure      400    {object}  models.ErrorResponse
// @Router       /stands/{id} [put]
func UpdateStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid stand ID"})
		return
	}
	var stand models.Stand
	if err := c.ShouldBindJSON(&stand); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid request data"})
		return
	}
	stand.ID = uint(id)
	if err := services.UpdateStand(&stand); err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, stand)
}

// @Summary      Supprimer un stand
// @Description  Supprime un stand par son ID
// @Tags         Stands
// @Param        id   path      int  true  "ID du stand"
// @Success      204  {string}  string  "Stand deleted"
// @Failure      400  {object}  models.ErrorResponse
// @Router       /stands/{id} [delete]
func DeleteStand(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid stand ID"})
		return
	}
	if err := services.DeleteStand(uint(id)); err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusNoContent, gin.H{"message": "Stand deleted"})
}

// @Summary      Récupérer tous les stands
// @Description  Récupère la liste de tous les stands
// @Tags         Stands
// @Produce      json
// @Success      200  {array}   models.Stand
// @Router       /stands [get]
func GetAllStands(c *gin.Context) {
	stands, err := services.GetAllStands()
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, stands)
}
