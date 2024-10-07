package services

import (
	"crypto/rand"
	"encoding/hex"
	"errors"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/mailjet/mailjet-apiv3-go"
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

// sendResetEmail envoie un e-mail de réinitialisation via Mailjet
func sendResetEmail(email, token string) {
	// Récupérer les variables d'environnement
	from := os.Getenv("MAILJET_FROM_EMAIL")    // Votre adresse e-mail d'envoi
	fromName := os.Getenv("MAILJET_FROM_NAME") // Nom de l'expéditeur
	baseURL := os.Getenv("BASE_URL")           // URL de base configurable via .env
	basePORT := os.Getenv("BASE_PORT")         // URL de base configurable via .env

	// Construire le lien de réinitialisation de mot de passe
	resetLink := fmt.Sprintf("https://%s:%s/reset-password?token=%s", baseURL, basePORT, token)
	subject := "Réinitialisation de mot de passe"
	htmlContent := fmt.Sprintf("<h3>Réinitialisation de votre mot de passe</h3><p>Cliquez sur ce lien pour réinitialiser votre mot de passe : <a href='%s'>Réinitialiser</a></p>", resetLink)
	textContent := fmt.Sprintf("Ceci est un lien pour réinitialiser votre mot de passe : %s", resetLink)

	// Créer un client Mailjet avec les clés API
	mailjetClient := mailjet.NewMailjetClient(os.Getenv("MAILJET_API_KEY_PUBLIC"), os.Getenv("MAILJET_API_KEY_PRIVATE"))

	// Créer les informations du message
	messagesInfo := []mailjet.InfoMessagesV31{
		{
			From: &mailjet.RecipientV31{
				Email: from,
				Name:  fromName,
			},
			To: &mailjet.RecipientsV31{
				{
					Email: email,
					Name:  "Utilisateur", // Vous pouvez personnaliser le nom si nécessaire
				},
			},
			Subject:  subject,
			TextPart: textContent,
			HTMLPart: htmlContent,
			CustomID: "PasswordReset",
		},
	}

	// Envoyer l'e-mail via Mailjet
	messages := mailjet.MessagesV31{Info: messagesInfo}
	res, err := mailjetClient.SendMailV31(&messages)
	if err != nil {
		log.Fatal("Erreur lors de l'envoi de l'e-mail :", err)
	} else {
		fmt.Printf("E-mail de réinitialisation envoyé avec succès à %s. Réponse : %+v\n", email, res)
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
