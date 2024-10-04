// routes/kermesse_routes.go
package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeTombolaRoutes(r *gin.RouterGroup) {
	tombolaRoutes := r.Group("/tombolas")
	{
		tombolaRoutes.POST("/", controllers.CreateTombola)
		tombolaRoutes.POST("/:tombola_id/lots", controllers.AddLotToTombola)
		tombolaRoutes.POST("/:tombola_id/tickets/:user_id", controllers.BuyTombolaTicket)
		tombolaRoutes.GET("/:tombola_id/draw", controllers.DrawTombola)
	}
}
