package services

import (
	"crypto/rand"
	"encoding/hex"
	"errors"
	"fmt"
	"net/smtp"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"golang.org/x/crypto/bcrypt"
)

var jwtSecret = []byte("your_secret_key")

// GenerateJWT génère un jeton JWT pour l'utilisateur donné
func GenerateJWT(userID uint, username, role string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"userID":   userID,
		"username": username,
		"role":     role,
		"exp":      time.Now().Add(time.Hour * 72).Unix(), // Expire dans 72 heures
	})

	tokenString, err := token.SignedString(jwtSecret)
	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// ValidateJWT vérifie si un jeton JWT est valide
func ValidateJWT(tokenString string) (jwt.MapClaims, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return jwtSecret, nil
	})

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		return claims, nil
	} else {
		return nil, err
	}
}

// GenerateResetToken génère un token de réinitialisation et l'associe à l'utilisateur
func GenerateResetToken(email string) (string, error) {
	var user models.User
	if err := database.DB.Where("email = ?", email).First(&user).Error; err != nil {
		return "", errors.New("Utilisateur introuvable")
	}

	// Générer un token de réinitialisation
	tokenBytes := make([]byte, 16)
	if _, err := rand.Read(tokenBytes); err != nil {
		return "", err
	}
	token := hex.EncodeToString(tokenBytes)

	// Mettre à jour l'utilisateur avec le token et sa date d'expiration (1 heure plus tard)
	user.ResetToken = token
	user.ResetTokenExpiry = time.Now().Add(1 * time.Hour)
	if err := database.DB.Save(&user).Error; err != nil {
		return "", err
	}

	// Envoyer l'email de réinitialisation
	sendResetEmail(user.Email, token)

	return token, nil
}

// sendResetEmail envoie un e-mail de réinitialisation
func sendResetEmail(email, token string) {
	// Configuration SMTP (à adapter en fonction de ton fournisseur)
	from := "your-email@example.com"
	password := "your-email-password"
	smtpHost := "smtp.example.com"
	smtpPort := "587"

	msg := fmt.Sprintf("Cliquez sur ce lien pour réinitialiser votre mot de passe : http://localhost:8080/reset-password?token=%s", token)
	message := []byte("Subject: Réinitialisation de mot de passe\n\n" + msg)

	auth := smtp.PlainAuth("", from, password, smtpHost)
	err := smtp.SendMail(smtpHost+":"+smtpPort, auth, from, []string{email}, message)
	if err != nil {
		fmt.Println("Erreur lors de l'envoi de l'email :", err)
	}
}

// ResetPassword réinitialise le mot de passe d'un utilisateur à l'aide du token de réinitialisation
func ResetPassword(token, newPassword string) error {
	var user models.User
	if err := database.DB.Where("reset_token = ?", token).First(&user).Error; err != nil {
		return errors.New("Token invalide")
	}

	// Vérifier que le token n'a pas expiré
	if user.ResetTokenExpiry.Before(time.Now()) {
		return errors.New("Token expiré")
	}

	// Mettre à jour le mot de passe
	hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(newPassword), bcrypt.DefaultCost)
	user.PasswordHash = string(hashedPassword)
	user.ResetToken = ""               // Supprimer le token de réinitialisation
	user.ResetTokenExpiry = time.Now() // Réinitialiser la date d'expiration

	if err := database.DB.Save(&user).Error; err != nil {
		return err
	}
	return nil
}
