package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeAdminRoutes(r *gin.Engine) {
	adminRoutes := r.Group("/admin")
	{
		// Assuming admins can view all statistics and manage users
		adminRoutes.GET("/statistics", controllers.GetStatisticsHandler)
		adminRoutes.POST("/create-user", controllers.CreateUserHandler)
	}
}
