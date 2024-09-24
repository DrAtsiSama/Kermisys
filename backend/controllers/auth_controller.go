package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Importer les modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Connexion
// @Description  Authentifie un utilisateur et retourne un jeton JWT
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  formData  string  true  "Nom d'utilisateur"
// @Param        password  formData  string  true  "Mot de passe"
// @Success      200  {object}  models.LoginResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /login [post]
func Login(c *gin.Context) {
	username := c.PostForm("username")
	password := c.PostForm("password")

	// Vérifier le mot de passe de l'utilisateur
	user, exists := services.GetUser(username)
	if !exists || !services.CheckPassword(user, password) {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid username or password"})
		return
	}

	// Générer un JWT
	token, err := services.GenerateJWT(username, user.Role)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, models.LoginResponse{Token: token})
}

// @Summary      Inscription
// @Description  Crée un nouvel utilisateur
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  formData  string  true  "Nom d'utilisateur"
// @Param        password  formData  string  true  "Mot de passe"
// @Param        role      formData  string  true  "Rôle de l'utilisateur"
// @Success      201  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /register [post]
func Register(c *gin.Context) {
	username := c.PostForm("username")
	password := c.PostForm("password")
	role := c.PostForm("role")

	if username == "" || password == "" || role == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing username, password, or role"})
		return
	}

	// Ajouter l'utilisateur
	services.CreateUser(username, role)
	services.SetPassword(username, password)
	c.JSON(http.StatusCreated, models.MessageResponse{Message: "User registered successfully"})
}

// @Summary      Déconnexion
// @Description  Déconnexion de l'utilisateur
// @Tags         Authentification
// @Produce      json
// @Success      200  {object}  models.MessageResponse
// @Router       /logout [post]
func Logout(c *gin.Context) {
	c.JSON(http.StatusOK, models.MessageResponse{Message: "User logged out successfully"})
}

// @Summary      Réinitialiser le mot de passe
// @Description  Permet à un utilisateur de réinitialiser son mot de passe
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username     formData  string  true  "Nom d'utilisateur"
// @Param        newPassword  formData  string  true  "Nouveau mot de passe"
// @Success      200  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /reset-password [post]
func ResetPassword(c *gin.Context) {
	username := c.PostForm("username")
	newPassword := c.PostForm("newPassword")

	if username == "" || newPassword == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing username or newPassword"})
		return
	}

	services.SetPassword(username, newPassword)
	c.JSON(http.StatusOK, models.MessageResponse{Message: "Password reset successfully"})
}
