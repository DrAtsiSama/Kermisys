package services

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func RoleMiddleware(role string) gin.HandlerFunc {
	return func(c *gin.Context) {
		userRole := c.GetString("role")
		if userRole != role {
			c.JSON(http.StatusForbidden, gin.H{"error": "You don't have permission"})
			c.Abort()
			return
		}
		c.Next()
	}
}
