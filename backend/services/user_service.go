package services

import (
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
func CreateUser(username, role string) error {
	user := models.User{
		Username: username,
		Role:     role,
	}
	if err := database.DB.Create(&user).Error; err != nil {
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
