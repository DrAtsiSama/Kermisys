package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Importer les modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Interaction avec un stand
// @Description  Permet à un utilisateur d'interagir avec un stand spécifique (nourriture, boisson, activité, etc.)
// @Tags         Stand
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
