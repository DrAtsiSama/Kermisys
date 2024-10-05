package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializePaymentRoutes(r *gin.RouterGroup) {
	paymentRoutes := r.Group("/payments")
	{
		// Payment processing route
		paymentRoutes.POST("", middlewares.RoleMiddleware("admin", "organisateur", "parent"), controllers.ProcessPayment)
		// paymentRoutes.POST("", controllers.CreatePayment)
		paymentRoutes.GET("/user/:userID", middlewares.RoleMiddleware("admin", "organisateur", "parent"), controllers.GetTransactionsByUserID)
	}
}
