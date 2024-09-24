package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Import du package models
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Authentification de l'utilisateur
// @Description  Authentifie un utilisateur et retourne un token JWT
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  formData  string  true  "Nom d'utilisateur"
// @Param        role      formData  string  true  "Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur')"
// @Success      200  {object}  models.TokenResponse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /login [post]
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
	c.JSON(http.StatusOK, models.TokenResponse{Token: token})
}
