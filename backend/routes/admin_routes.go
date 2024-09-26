package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeAdminRoutes(r *gin.RouterGroup) {
	adminRoutes := r.Group("/admin")
	{
		// Applique le middleware pour vérifier que l'utilisateur a le rôle "admin"
		adminRoutes.Use(middlewares.RoleMiddleware("admin"))

		// Assuming admins can view all statistics and manage users
		adminRoutes.GET("/statistics", controllers.GetStatisticsHandler)
		adminRoutes.POST("/create-user", controllers.CreateUserHandler)
	}
}
