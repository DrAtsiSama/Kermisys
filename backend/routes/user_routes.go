package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeUserRoutes(r *gin.RouterGroup) {
	userRoutes := r.Group("/user")
	{
		// General user routes
		userRoutes.GET("/:username", controllers.GetUserHandler)
		userRoutes.POST("/create", controllers.CreateUserHandler)
	}
}
