package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeTombolaRoutes(r *gin.RouterGroup) {
	tombolaRoutes := r.Group("/tombolas")
	{
		// Route accessible uniquement par les admins et organisateurs
		tombolaRoutes.POST("/create/:kermesse_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.CreateTombola)
		tombolaRoutes.PUT("/:tombola_id/edit", middlewares.RoleMiddleware("admin", "organisateur"), controllers.UpdateTombola)
		tombolaRoutes.DELETE("/:tombola_id/delete", middlewares.RoleMiddleware("admin", "organisateur"), controllers.DeleteTombola)
		tombolaRoutes.POST("/:tombola_id/lot", middlewares.RoleMiddleware("admin", "organisateur"), controllers.AddLotToTombola)
		tombolaRoutes.DELETE("/:tombola_id/lot/:lot_id", middlewares.RoleMiddleware("admin", "organisateur"), controllers.RemoveLotFromTombola)
		tombolaRoutes.GET("/:tombola_id", controllers.GetTombola)
		tombolaRoutes.POST("/:tombola_id/draw", middlewares.RoleMiddleware("admin", "organisateur"), controllers.DrawTombola)
		tombolaRoutes.GET("/:tombola_id/lots-won", controllers.GetUserWonLots)
		tombolaRoutes.POST("/:tombola_id/buy-ticket", controllers.BuyTombolaTicket)
	}
}
