package middlewares

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

// RoleMiddleware vérifie que l'utilisateur a l'un des rôles requis
func RoleMiddleware(requiredRoles ...string) gin.HandlerFunc {
	return func(c *gin.Context) {
		role, exists := c.Get("role")
		if !exists {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Accès non autorisé"})
			c.Abort()
			return
		}

		userRole := role.(string)
		for _, requiredRole := range requiredRoles {
			if strings.EqualFold(userRole, requiredRole) {
				c.Next()
				return
			}
		}

		c.JSON(http.StatusForbidden, gin.H{"error": "Permission refusée"})
		c.Abort()
	}
}
