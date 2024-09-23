package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializePaymentRoutes(r *gin.Engine) {
	paymentRoutes := r.Group("/payment")
	{
		// Payment processing route
		paymentRoutes.POST("/process", controllers.ProcessPayment)
	}
}
