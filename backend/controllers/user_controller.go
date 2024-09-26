package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Import des modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Récupérer les détails d'un utilisateur
// @Description  Récupère les informations d'un utilisateur à partir de son nom d'utilisateur
// @Tags         Utilisateurs
// @Produce      json
// @Param        username  path  string  true  "Nom d'utilisateur"
// @Success      200  {object}  models.UserResponse
// @Failure      404  {object}  models.ErrorResponse
// @Router       /users/{username} [get]
func GetUserHandler(c *gin.Context) {
	username := c.Param("username")
	user, exists := services.GetUser(username)
	if !exists {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "User not found"})
		return
	}
	c.JSON(http.StatusOK, models.UserResponse{
		ID:       user.ID,
		Username: user.Username,
		Email:    user.Email,
		Role:     user.Role,
	})
}

// @Summary      Créer un nouvel utilisateur
// @Description  Crée un nouvel utilisateur avec le nom d'utilisateur, l'adresse e-mail, et le rôle spécifiés
// @Tags         Utilisateurs
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  formData  string  true  "Nom d'utilisateur"
// @Param        email     formData  string  true  "Adresse e-mail"
// @Param        role      formData  string  true  "Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur')"
// @Success      201  {object}  models.CreateUserResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /users [post]
func CreateUserHandler(c *gin.Context) {
	username := c.PostForm("username")
	email := c.PostForm("email")
	role := c.PostForm("role")

	if username == "" || email == "" || role == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing username, email, or role"})
		return
	}

	err := services.CreateUser(username, email, role)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusCreated, models.CreateUserResponse{Message: "User created"})
}
