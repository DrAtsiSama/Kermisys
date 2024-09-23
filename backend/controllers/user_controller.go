package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// GetUserHandler returns the details of a user
func GetUserHandler(c *gin.Context) {
	username := c.Param("username")
	user, exists := services.GetUser(username)
	if !exists {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
		return
	}
	c.JSON(http.StatusOK, user)
}

// CreateUserHandler creates a new user
func CreateUserHandler(c *gin.Context) {
	username := c.PostForm("username")
	role := c.PostForm("role")

	if username == "" || role == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Missing username or role"})
		return
	}

	services.CreateUser(username, role)
	c.JSON(http.StatusCreated, gin.H{"message": "User created"})
}
