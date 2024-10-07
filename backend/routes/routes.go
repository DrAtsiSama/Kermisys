package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

// InitRoutes initializes all routes for the application
func InitRoutes() *gin.Engine {
	r := gin.Default()

	// Ajout de la gestion d'erreurs globales
	r.Use(middlewares.ErrorHandlingMiddleware())

	// Ajout de la sécurité des en-têtes
	r.Use(middlewares.SecurityHeadersMiddleware())

	// Configurer CORS
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://217.69.9.54:8080", "http://localhost:8080"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Authorization", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	// Auth routes
	r.POST("/login", controllers.Login)
	r.POST("/register", controllers.Register)
	r.POST("/reset-password", controllers.ResetPassword)
	r.POST("/forgot-password", controllers.ForgotPassword)

	// Protected routes using JWT middleware
	protected := r.Group("/")
	protected.Use(middlewares.AuthMiddleware())
	{
		protected.POST("/logout", controllers.Logout)
		initializeChatRoutes(protected)
		initializeAdminRoutes(protected)
		initializeStandRoutes(protected)
		initializeKermesseRoutes(protected)
		initializeParentRoutes(protected)
		initializeUserRoutes(protected)
		initializePaymentRoutes(protected)
		initializeStatisticsRoutes(protected)
		initializeScoresRoutes(protected)
		initializeTombolaRoutes(protected)
	}

	return r
}
