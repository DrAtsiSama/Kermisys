package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"

	"github.com/gin-gonic/gin"
)

func CreateTombola(c *gin.Context) {
	var newTombola models.Tombola
	if err := c.ShouldBindJSON(&newTombola); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid data"})
		return
	}

	err := services.CreateTombola(newTombola)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Tombola créée avec succès"})
}

func BuyTombolaTicket(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	userID, _ := strconv.Atoi(c.Param("user_id"))

	err := services.BuyTicket(uint(tombolaID), uint(userID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Ticket acheté avec succès"})
}

func DrawTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))

	winner, err := services.DrawTombola(uint(tombolaID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"winner": winner})
}

// Ajouter un lot à une tombola
func AddLotToTombola(c *gin.Context) {
	tombolaID, _ := strconv.Atoi(c.Param("tombola_id"))
	var newLot models.Lot
	if err := c.ShouldBindJSON(&newLot); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid data"})
		return
	}

	err := services.AddLot(uint(tombolaID), newLot)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Lot ajouté avec succès"})
}
