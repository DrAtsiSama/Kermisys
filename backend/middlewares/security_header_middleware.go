package middlewares

import (
	"github.com/gin-gonic/gin"
)

// SecurityHeadersMiddleware ajoute des en-têtes de sécurité
func SecurityHeadersMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Header("X-Content-Type-Options", "nosniff")
		c.Header("X-Frame-Options", "DENY")
		c.Header("Content-Security-Policy", "default-src 'self'  'unsafe-inline' 'unsafe-eval' data:; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data:;")
		c.Header("X-XSS-Protection", "1; mode=block")
		c.Next()
	}
}
