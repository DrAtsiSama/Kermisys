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
