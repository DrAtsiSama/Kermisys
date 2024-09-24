package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeStandRoutes(r *gin.RouterGroup) {
	standRoutes := r.Group("/stand")
	{
		// Routes to interact with stands
		standRoutes.POST("/interact", controllers.InteractWithStand)
	}
}
