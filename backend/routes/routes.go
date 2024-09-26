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

	// Configurer CORS
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"}, // Change "*" par tes domaines si tu veux plus de sécurité
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Authorization", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	// Auth routes
	r.POST("/login", controllers.Login)
	r.POST("/register", controllers.Register)
	r.POST("/reset-password", controllers.ResetPassword)
	r.POST("/logout", controllers.Logout)
	r.POST("/forgot-password", controllers.ForgotPassword)

	// Protected routes using JWT middleware
	protected := r.Group("/")
	protected.Use(middlewares.AuthMiddleware())
	{
		protected.GET("/:username", controllers.GetUserHandler)
		initializeChatRoutes(protected)
		initializeAdminRoutes(protected)
		initializeStandRoutes(protected)
		initializeParentRoutes(protected)
		initializeUserRoutes(protected)
		initializePaymentRoutes(protected)
		initializeStatisticsRoutes(protected)
	}

	return r
}
