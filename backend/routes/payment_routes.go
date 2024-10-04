package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializePaymentRoutes(r *gin.RouterGroup) {
	paymentRoutes := r.Group("/payments")
	{
		// Payment processing route
		paymentRoutes.POST("", controllers.ProcessPayment)
		// paymentRoutes.POST("", controllers.CreatePayment)
		paymentRoutes.GET("/user/:userID", controllers.GetTransactionsByUserID)
	}
}
