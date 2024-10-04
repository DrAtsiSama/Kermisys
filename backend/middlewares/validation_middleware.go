package middlewares

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// ValidationMiddleware vérifie que le corps de la requête est valide
func ValidationMiddleware[T any]() gin.HandlerFunc {
	return func(c *gin.Context) {
		var newObj T
		log.Println("middleware Validation : ", newObj)
		if err := c.ShouldBindJSON(&newObj); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
			c.Abort()
			return
		}
		c.Set("validatedData", newObj)
		c.Next()
	}
}
