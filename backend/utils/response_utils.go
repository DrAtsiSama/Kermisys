package utils

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// RespondWithJSON envoie une réponse JSON avec un code HTTP
func RespondWithJSON(c *gin.Context, status int, payload interface{}) {
	c.JSON(status, payload)
}

// RespondWithError envoie une réponse JSON avec un message d'erreur
func RespondWithError(c *gin.Context, code int, message string) {
	c.JSON(code, gin.H{"error": message})
}

// RespondWithSuccess envoie une réponse JSON de succès avec un message
func RespondWithSuccess(c *gin.Context, message string) {
	c.JSON(http.StatusOK, gin.H{"message": message})
}
