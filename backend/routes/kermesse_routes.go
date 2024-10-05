// routes/kermesse_routes.go
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
		kermesseRoutes.POST("", middlewares.RoleMiddleware("admin", "organisateur"), controllers.CreateKermesse)
		kermesseRoutes.GET("/:id", controllers.GetKermesseByID)
		kermesseRoutes.PUT("/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.UpdateKermesse)
		kermesseRoutes.DELETE("/:id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.DeleteKermesse)
		kermesseRoutes.POST("/:id/participants/:user_id", controllers.AddParticipantToKermesse)
		kermesseRoutes.POST("/:id/stands/:stand_id", controllers.AddStandToKermesse)
		kermesseRoutes.POST("/leave/:kermesse_id", controllers.LeaveKermesseHandler)
		kermesseRoutes.POST("/join/:kermesse_id", controllers.JoinKermesseHandler)
	}
}
