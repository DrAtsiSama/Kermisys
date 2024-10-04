package controllers

import (
	"log"
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/database"
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
// @Router       /user/{username} [get]
// @Security Bearer
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
// @Param        password  formData  string  true  "Mot de passe de l'utilisateur"
// @Success      201  {object}  models.CreateUserResponse
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user [post]
// @Security Bearer
func CreateUserHandler(c *gin.Context) {
	username := c.PostForm("username")
	email := c.PostForm("email")
	role := c.PostForm("role")
	password := c.PostForm("password")

	if username == "" || email == "" || role == "" || password == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing username, email, role, or password"})
		return
	}

	err := services.CreateUser(username, email, role)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	// Définir le mot de passe de l'utilisateur
	err = services.SetPassword(username, password)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to set password"})
		return
	}

	c.JSON(http.StatusCreated, models.CreateUserResponse{Message: "User created"})
}

// @Summary      Ajouter une demande parent-enfant
// @Description  Permet de créer une nouvelle demande pour lier un parent et un enfant en utilisant leurs noms d'utilisateur
// @Tags         Parent-Enfant
// @Accept       json
// @Produce      json
// @Param        parent_username  formData  string  true  "Nom d'utilisateur du parent"
// @Param        child_username   formData  string  true  "Nom d'utilisateur de l'enfant"
// @Success      201  {object}  models.ParentChildRequest
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/parent-requests [post]
// @Security Bearer
func CreateParentChildRequest(c *gin.Context) {
	// Récupérer les paramètres parent_username et child_username à partir du formulaire
	parentUsername := c.PostForm("parent_username")
	childUsername := c.PostForm("child_username")

	// Vérifie si les champs sont vides
	if parentUsername == "" || childUsername == "" {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Missing parent_username or child_username"})
		return
	}

	// Chercher le parent par son nom d'utilisateur
	var parent models.User
	if err := database.DB.Where("username = ?", parentUsername).First(&parent).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Parent not found"})
		return
	}

	// Chercher l'enfant par son nom d'utilisateur
	var child models.User
	if err := database.DB.Where("username = ?", childUsername).First(&child).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Child not found"})
		return
	}

	// Appel du service avec les IDs convertis en int
	err := services.CreateParentChildRequest(int(parent.ID), int(child.ID))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Parent-child request created"})
}

// @Summary      Accepter une demande parent-enfant
// @Description  Permet d'accepter une demande existante pour lier un parent et un enfant
// @Tags         Parent-Enfant
// @Produce      json
// @Param        id  path  int  true  "ID de la demande"
// @Success      200  {object}  models.ParentChildRequest
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/parent-requests/accept/{id} [put]
// @Security Bearer
func AcceptParentChildRequest(c *gin.Context) {
	requestIDStr := c.Param("id")

	// Conversion de l'ID en int
	requestID, err := strconv.Atoi(requestIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid request ID"})
		return
	}

	// Récupérer la demande parent-enfant
	var request models.ParentChildRequest
	if err := database.DB.First(&request, requestID).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Request not found"})
		return
	}

	// Mettre à jour le rôle de l'enfant en "enfant"
	var child models.User
	if err := database.DB.First(&child, request.ChildID).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Child not found"})
		return
	}

	child.Role = "eleve" // Mise à jour du rôle
	if err := database.DB.Save(&child).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to update child role"})
		return
	}

	// Mettre à jour le statut de la demande en "accepté"
	if err := services.UpdateParentChildRequestStatus(requestIDStr, "accepted"); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	// Supprimer la demande de la table `parent_child_requests` après acceptation
	if err := database.DB.Delete(&request).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to delete request"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Request accepted and child role updated"})
}

// @Summary      Refuser une demande parent-enfant
// @Description  Permet de refuser une demande existante pour lier un parent et un enfant
// @Tags         Parent-Enfant
// @Produce      json
// @Param        id  path  int  true  "ID de la demande"
// @Success      200  {object}  models.ParentChildRequest
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/parent-requests/reject/{id} [put]
// @Security Bearer
func RejectParentChildRequest(c *gin.Context) {
	requestIDStr := c.Param("id")

	// Conversion de l'ID en int
	requestID, err := strconv.Atoi(requestIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid request ID"})
		return
	}

	// Récupérer la demande parent-enfant
	var request models.ParentChildRequest
	if err := database.DB.First(&request, requestID).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Request not found"})
		return
	}

	// Mettre à jour le statut de la demande en "rejeté"
	if err := services.UpdateParentChildRequestStatus(requestIDStr, "rejected"); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: err.Error()})
		return
	}

	// Supprimer la demande de la table `parent_child_requests` après rejet
	if err := database.DB.Delete(&request).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to delete request"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Request rejected and deleted"})
}

// @Summary      Liste des demandes parent-enfant pour l'utilisateur connecté
// @Description  Renvoie la liste de toutes les demandes en attente de traitement pour l'utilisateur connecté
// @Tags         Parent-Enfant
// @Produce      json
// @Success      200  {array}  models.ParentChildRequest
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/parent-requests/requests [get]
// @Security Bearer
func ListParentChildRequests(c *gin.Context) {
	// Récupérer l'ID utilisateur depuis le JWT (middleware JWT doit être configuré pour ajouter l'ID utilisateur)
	userID, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Impossible de récupérer l'ID utilisateur depuis le token"})
		return
	}

	// Vérifier si l'utilisateur existe
	var user models.User
	log.Println("user : ", userID, user)
	if err := database.DB.First(&user, userID).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Utilisateur non trouvé"})
		return
	}

	var requests []models.ParentChildRequest

	// Récupérer les demandes pour lesquelles l'utilisateur est parent ou enfant
	// Utiliser Preload pour charger les relations Parent et Child
	if err := database.DB.Preload("Parent").Preload("Child").
		Where("(parent_id = ? OR child_id = ?) AND status = ?", userID, userID, "pending").
		Find(&requests).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Impossible de récupérer les demandes"})
		return
	}

	c.JSON(http.StatusOK, requests)
}

// @Summary      Liste des enfants associés à un parent
// @Description  Renvoie la liste de tous les enfants associés à un parent spécifique
// @Tags         Parent-Enfant
// @Produce      json
// @Success      200  {array}  models.User
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/children [get]
// @Security Bearer
func ListChildrenHandler(c *gin.Context) {
	// Récupérer l'ID du parent connecté depuis le JWT
	userID, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Utilisateur non authentifié"})
		return
	}

	// Rechercher tous les enfants associés à ce parent
	var children []models.User
	if err := services.GetChildrenByParentID(userID.(uint), &children); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Impossible de récupérer les enfants"})
		return
	}

	c.JSON(http.StatusOK, children)
}

// @Summary      Supprimer un enfant associé à un parent
// @Description  Permet de désassocier un enfant d'un parent et de lui réassigner le rôle par défaut "parent"
// @Tags         Parent-Enfant
// @Produce      json
// @Param        child_id  path  int  true  "ID de l'enfant"
// @Success      200  {object}  models.User
// @Failure      400  {object}  models.ErrorResponse
// @Router       /user/children/{child_id} [delete]
// @Security Bearer
func RemoveChildHandler(c *gin.Context) {
	// Récupérer l'ID de l'enfant depuis les paramètres
	childIDStr := c.Param("child_id")
	childID, err := strconv.Atoi(childIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid child ID"})
		return
	}

	// Supprimer l'enfant et lui réassigner le rôle "parent"
	if err := services.RemoveChild(childID); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Impossible de supprimer l'enfant"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Enfant supprimé et rôle réassigné"})
}
