package services

import (
	"time"

	"github.com/dgrijalva/jwt-go"
)

var jwtSecret = []byte("your_secret_key")

// GenerateJWT génère un jeton JWT pour l'utilisateur donné
func GenerateJWT(username, role string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
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
