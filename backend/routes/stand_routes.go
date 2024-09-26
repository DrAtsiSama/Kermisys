package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeStandRoutes(r *gin.RouterGroup) {
	standRoutes := r.Group("/stands")
	{
		// Routes to interact with stands
		standRoutes.POST("/interact", controllers.InteractWithStand)
		standRoutes.GET("/:id", controllers.GetStand)
		standRoutes.GET("", controllers.GetAllStands)

		standRoutes.POST("", middlewares.RoleMiddleware("admin", "organisateur"), controllers.CreateStand)
		standRoutes.PUT("/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.UpdateStand)
		standRoutes.DELETE("/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.DeleteStand)
	}
}
