package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// Login authenticates a user and returns a JWT token
func Login(c *gin.Context) {
	username := c.PostForm("username")
	role := c.PostForm("role")

	if username == "" || role == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Missing username or role"})
		return
	}

	token, err := services.GenerateJWT(username, role)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"token": token})
}
