package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"

	"github.com/gin-gonic/gin"
)

func BuyTombolaTicket(c *gin.Context) {
	username := c.GetString("username")
	services.BuyTombolaTicket(username, 1)
	c.JSON(http.StatusOK, gin.H{"message": "Ticket bought"})
}

func DrawTombola(c *gin.Context) {
	winner := services.DrawTombola()
	c.JSON(http.StatusOK, gin.H{"winner": winner})
}
