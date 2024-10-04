package middlewares

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// ErrorHandlingMiddleware intercepte les erreurs et les gère de manière cohérente
func ErrorHandlingMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Next()

		if len(c.Errors) > 0 {
			for _, e := range c.Errors {
				log.Printf("Erreur interceptée : %v", e.Err)
			}
			c.JSON(http.StatusInternalServerError, gin.H{"error": "An unexpected error occurred"})
		}
	}
}
