package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeStatisticsRoutes(r *gin.RouterGroup) {
	statisticsRoutes := r.Group("/stats")
	statisticsRoutes.Use(middlewares.AuthMiddleware())
	{
		// Route to view statistics
		statisticsRoutes.GET("/", middlewares.RoleMiddleware("admin", "organisateur"), controllers.GetStatisticsHandler)
		statisticsRoutes.GET("/kermesse/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.GetKermesseStats)
		statisticsRoutes.GET("/stand/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.GetStandStats)
		statisticsRoutes.GET("/organisateur/:id", middlewares.RoleMiddleware("admin"), controllers.GetOrganisateurStats)
	}
}
