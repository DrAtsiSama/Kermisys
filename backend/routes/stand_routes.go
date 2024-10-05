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
		standRoutes.POST("/:stand_id/interact", middlewares.RoleMiddleware("admin", "organisateur", "parent", "enfant"), controllers.InteractWithStand)
		standRoutes.GET("/:stand_id", controllers.GetStand)
		standRoutes.GET("", controllers.GetAllStands)
		standRoutes.POST("", middlewares.RoleMiddleware("admin", "organisateur", "parent", "gerant_stand"), controllers.CreateStand)
		standRoutes.PUT("/:stand_id", middlewares.RoleMiddleware("admin", "organisateur", "gerant_stand"), controllers.UpdateStand)    // Modifier ici aussi
		standRoutes.DELETE("/:stand_id", middlewares.RoleMiddleware("admin", "organisateur", "gerant_stand"), controllers.DeleteStand) // Et ici aussi
		standRoutes.GET("/:stand_id/players/:user_id/score", middlewares.RoleMiddleware("admin", "organisateur", "gerant_stand"), controllers.GetPlayerScore)
	}
}
