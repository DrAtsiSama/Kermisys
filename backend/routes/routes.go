package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

// InitRoutes initializes all routes for the application
func InitRoutes() *gin.Engine {
	r := gin.Default()

	// Auth routes
	r.POST("/login", controllers.Login)
	r.POST("/register", controllers.Register)
	r.POST("/reset-password", controllers.ResetPassword)
	r.POST("/logout", controllers.Logout)

	// Protected routes using JWT middleware
	protected := r.Group("/")
	protected.Use(middlewares.AuthMiddleware())
	{
		initializeAdminRoutes(protected)
		initializeParentRoutes(protected)
		initializeStandRoutes(protected)
		initializeUserRoutes(protected)
		initializeChatRoutes(protected)
		initializePaymentRoutes(protected)
		initializeStatisticsRoutes(protected)
	}

	return r
}
