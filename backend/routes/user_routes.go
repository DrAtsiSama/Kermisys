package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeUserRoutes(r *gin.RouterGroup) {
	userRoutes := r.Group("/user")
	{
		// General user routes
		userRoutes.GET("/:username", middlewares.RoleMiddleware("admin", "organisateur"), controllers.GetUserHandler)
		userRoutes.POST("/", middlewares.RoleMiddleware("admin", "organisateur"), controllers.CreateUserHandler)
	}
}
