package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"

	"github.com/gin-gonic/gin"
)

func InteractWithStand(c *gin.Context) {
	username := c.GetString("username")
	stand := c.PostForm("stand")
	err := services.InteractWithStand(username, stand, 1)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Stand interaction successful"})
}
