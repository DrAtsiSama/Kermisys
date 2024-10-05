package services

import (
	"errors"
	"fmt"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"golang.org/x/crypto/bcrypt"
)

type User struct {
	ID           uint
	Username     string
	Email        string
	PasswordHash string // Ajout du champ PasswordHash
	Role         string
}

var users = map[string]User{
	"user1": {ID: 1, Username: "user1", Email: "user1@example.com", PasswordHash: "$2a$10$abc123...", Role: "admin"},
	"user2": {ID: 2, Username: "user2", Email: "user2@example.com", PasswordHash: "$2a$10$abc123...", Role: "parent"},
}

// CreateUser ajoute un nouvel utilisateur dans la base de données
func CreateUser(username, email, role string) error {
	user := models.User{
		Username: username,
		Email:    email,
		Role:     role,
	}
	// Vérifie si l'e-mail existe déjà
	var existingUser models.User
	if err := database.DB.Where("email = ?", email).First(&existingUser).Error; err == nil {
		fmt.Println("Erreur : Cet email existe déjà dans la base de données")
		return errors.New("email already exists")
	}

	// Vérifie si l'username existe déjà
	if err := database.DB.Where("username = ?", username).First(&existingUser).Error; err == nil {
		fmt.Println("Erreur : Le nom d'utilisateur existe déjà dans la base de données")
		return errors.New("Username already exists")
	}
	// Tentative d'ajout de l'utilisateur à la base de données
	if err := database.DB.Create(&user).Error; err != nil {
		fmt.Println("Erreur lors de la création de l'utilisateur :", err)
		return err
	}
	return nil
}

// GetUser récupère un utilisateur par son nom d'utilisateur
func GetUser(username string) (models.User, bool) {
	var user models.User
	if err := database.DB.Where("username = ?", username).First(&user).Error; err != nil {
		return user, false
	}
	return user, true
}

// SetPassword met à jour le mot de passe d'un utilisateur en le hachant
func SetPassword(username, password string) error {
	hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err := database.DB.Model(&models.User{}).Where("username = ?", username).Update("password_hash", hashedPassword).Error; err != nil {
		return err
	}
	return nil
}

// CheckPassword vérifie si le mot de passe de l'utilisateur est correct
func CheckPassword(user models.User, password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password))
	return err == nil
}
func CreateParentChildRequest(parentID, childID int) error {
	request := models.ParentChildRequest{
		ParentID: uint(parentID),
		ChildID:  uint(childID),
		Status:   "pending", // Par défaut, la demande est en attente
	}

	// Vérifie si une demande similaire existe déjà
	var existingRequest models.ParentChildRequest
	if err := database.DB.Where("parent_id = ? AND child_id = ?", parentID, childID).First(&existingRequest).Error; err == nil {
		return errors.New("A request already exists")
	}

	if err := database.DB.Create(&request).Error; err != nil {
		return err
	}

	return nil
}

func UpdateParentChildRequestStatus(requestID, status string) error {
	var request models.ParentChildRequest
	if err := database.DB.First(&request, requestID).Error; err != nil {
		return errors.New("Request not found")
	}

	if request.Status != "pending" {
		return errors.New("Request already processed")
	}

	// Mise à jour du statut de la demande
	request.Status = status
	if err := database.DB.Save(&request).Error; err != nil {
		return err
	}

	if status == "accepted" {
		// Si la demande est acceptée, lier le parent à l'enfant
		parentChild := models.ParentChild{
			ParentID: request.ParentID,
			ChildID:  request.ChildID,
		}
		if err := database.DB.Create(&parentChild).Error; err != nil {
			return err
		}
	}

	return nil
}

// GetChildrenByParentID récupère tous les enfants associés à un parent
func GetChildrenByParentID(parentID uint, children *[]models.User) error {
	var parentChildRelations []models.ParentChild
	if err := database.DB.Where("parent_id = ?", parentID).Find(&parentChildRelations).Error; err != nil {
		return err
	}

	// Récupérer les enfants à partir des relations
	childIDs := []uint{}
	for _, relation := range parentChildRelations {
		childIDs = append(childIDs, relation.ChildID)
	}

	if len(childIDs) == 0 {
		return nil
	}

	if err := database.DB.Where("id IN ?", childIDs).Find(children).Error; err != nil {
		return err
	}

	return nil
}

// RemoveChild désassocie un enfant d'un parent et réassigne le rôle par défaut "parent"
func RemoveChild(childID int) error {
	// Supprimer la relation parent-enfant
	if err := database.DB.Where("child_id = ?", childID).Delete(&models.ParentChild{}).Error; err != nil {
		return err
	}

	// Réassigner le rôle "parent" à l'utilisateur enfant
	var child models.User
	if err := database.DB.First(&child, childID).Error; err != nil {
		return err
	}

	child.Role = "parent"
	if err := database.DB.Save(&child).Error; err != nil {
		return err
	}

	return nil
}

func GetTotalTokens(userID uint) (int, error) {
	var totalTokens int
	// Utiliser COALESCE pour éviter que SUM renvoie NULL
	err := database.DB.Model(&models.Token{}).
		Where("user_id = ?", userID).
		Select("COALESCE(SUM(amount), 0)").Scan(&totalTokens).Error
	if err != nil {
		return 0, err
	}

	return totalTokens, nil
}

// DeductUserTokens retire un nombre de jetons de l'utilisateur
func DeductUserTokens(userID uint, amount int) error {
	var totalTokens int
	err := database.DB.Model(&models.Token{}).Where("user_id = ?", userID).Select("SUM(amount)").Scan(&totalTokens).Error
	if err != nil {
		return err
	}

	// Vérification si l'utilisateur a assez de jetons
	if totalTokens < amount {
		return errors.New("Not enough tokens")
	}

	// Déduire les jetons
	err = database.DB.Model(&models.Token{}).Where("user_id = ?", userID).Update("amount", totalTokens-amount).Error
	if err != nil {
		return err
	}
	return nil
}

// isUserRegisteredForKermesse vérifie si un utilisateur est inscrit à une kermesse
func isUserRegisteredForKermesse(userID, kermesseID uint) bool {
	var kermesse models.Kermesse
	if err := database.DB.Preload("Participants").First(&kermesse, kermesseID).Error; err != nil {
		return false
	}

	for _, participant := range kermesse.Participants {
		if participant.ID == userID {
			return true
		}
	}
	return false
}

func IsOrganisateur(userID uint, kermesseID uint) bool {
	var kermesse models.Kermesse
	// Charger la kermesse et vérifier si l'utilisateur est dans la liste des organisateurs
	if err := database.DB.Preload("Organisateurs").First(&kermesse, kermesseID).Error; err != nil {
		return false
	}

	for _, organisateur := range kermesse.Organisateurs {
		if organisateur.ID == userID {
			return true
		}
	}
	return false
}

// IsParticipantOfKermesse vérifie si un utilisateur est un participant de la kermesse
func IsParticipantOfKermesse(kermesseID, userID uint) bool {
	var count int64
	// Vérifier si l'utilisateur fait partie des participants de la kermesse
	err := database.DB.Table("kermesse_participants").
		Where("kermesse_id = ? AND user_id = ?", kermesseID, userID).
		Count(&count).Error
	return err == nil && count > 0
}

// GetPlayerScore récupère le score d'un joueur pour un stand spécifique
func GetPlayerScore(userID, standID uint) (*models.PlayerScore, error) {
	var playerScore models.PlayerScore
	if err := database.DB.Where("user_id = ? AND stand_id = ?", userID, standID).First(&playerScore).Error; err != nil {
		return nil, err
	}
	return &playerScore, nil
}
