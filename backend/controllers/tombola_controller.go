package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Import des modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Acheter un billet de tombola
// @Description  Permet à un utilisateur d'acheter un billet de tombola
// @Tags         Tombola
// @Produce      json
// @Param        username  header  string  true  "Nom d'utilisateur"
// @Success      200  {object}  models.BuyTombolaTicketResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /tombola/buy [post]
func BuyTombolaTicket(c *gin.Context) {
	username := c.GetString("username")
	services.BuyTombolaTicket(username, 1)
	c.JSON(http.StatusOK, models.BuyTombolaTicketResponse{Message: "Ticket bought"})
}

// @Summary      Tirage de la tombola
// @Description  Effectue le tirage de la tombola et retourne le gagnant
// @Tags         Tombola
// @Produce      json
// @Success      200  {object}  models.DrawTombolaResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /tombola/draw [post]
func DrawTombola(c *gin.Context) {
	winner := services.DrawTombola()
	c.JSON(http.StatusOK, models.DrawTombolaResponse{Winner: winner})
}
