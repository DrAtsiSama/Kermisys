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
	token, err := services.GenerateJWT(user.ID, username, user.Role)
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
// @Param        email     formData  string  true  "Adresse e-mail"
// @Param        role      formData  string  true  "Rôle de l'utilisateur"
// @Success      201  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /register [post]
func Register(c *gin.Context) {
	username := c.PostForm("username")
	password := c.PostForm("password")
	email := c.PostForm("email")
	role := c.PostForm("role")

	// Vérifier si les champs obligatoires sont remplis
	if username == "" || password == "" || role == "" || email == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing username, password, email, or role"})
		return
	}

	// Ajouter l'utilisateur
	err := services.CreateUser(username, email, role)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to create user"})
		return
	}

	// Définir le mot de passe de l'utilisateur
	err = services.SetPassword(username, password)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to set password"})
		return
	}

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

// @Summary      Mot de passe oublié
// @Description  Envoie un lien de réinitialisation à l'utilisateur
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        email  formData  string  true  "Adresse e-mail"
// @Success      200  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /forgot-password [post]
func ForgotPassword(c *gin.Context) {
	email := c.PostForm("email")
	if email == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Adresse e-mail manquante"})
		return
	}

	_, err := services.GenerateResetToken(email)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Utilisateur introuvable"})
		return
	}

	c.JSON(http.StatusOK, models.MessageResponse{Message: "E-mail de réinitialisation envoyé"})
}

// @Summary      Réinitialiser le mot de passe
// @Description  Permet à un utilisateur de réinitialiser son mot de passe
// @Tags         Authentification
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        token       formData  string  true  "Token de réinitialisation"
// @Param        newPassword formData  string  true  "Nouveau mot de passe"
// @Success      200  {object}  models.MessageResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /reset-password [post]
func ResetPassword(c *gin.Context) {
	token := c.PostForm("token")
	newPassword := c.PostForm("newPassword")

	if token == "" || newPassword == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Token ou mot de passe manquant"})
		return
	}

	err := services.ResetPassword(token, newPassword)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, models.MessageResponse{Message: "Mot de passe réinitialisé avec succès"})
}
