package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeKermesseRoutes(r *gin.RouterGroup) {
	kermesseRoutes := r.Group("/kermesses")
	{
		kermesseRoutes.GET("", controllers.GetAllKermesses)
		kermesseRoutes.POST("", middlewares.RoleMiddleware("admin", "parent"), controllers.CreateKermesse)
		kermesseRoutes.GET("/:kermesse_id", controllers.GetKermesseByID)
		kermesseRoutes.PUT("/:kermesse_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.UpdateKermesse)
		kermesseRoutes.DELETE("/:kermesse_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.DeleteKermesse)
		kermesseRoutes.POST("/:kermesse_id/participants/:user_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.AddParticipantToKermesse)
		kermesseRoutes.POST("/:kermesse_id/stands/:stand_id", controllers.AddStandToKermesse)
		kermesseRoutes.POST("/leave/:kermesse_id", controllers.LeaveKermesseHandler)
		kermesseRoutes.POST("/join/:kermesse_id", controllers.JoinKermesseHandler)
		kermesseRoutes.GET("/:kermesse_id/participants", controllers.GetKermesseParticipants)

		// Routes pour les scores avec des chemins plus explicites
		kermesseRoutes.POST("/:kermesse_id/stands/:stand_id/player-scores/:user_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.AddOrUpdatePlayerScore)
		kermesseRoutes.DELETE("/:kermesse_id/stands/:stand_id/player-scores/:user_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.RemovePlayerScore)
	}
}
