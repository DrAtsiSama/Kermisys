package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeStatisticsRoutes(r *gin.RouterGroup) {
	statisticsRoutes := r.Group("/statistics")
	{
		// Route to view statistics
		statisticsRoutes.GET("/", controllers.GetStatisticsHandler)
	}
}
