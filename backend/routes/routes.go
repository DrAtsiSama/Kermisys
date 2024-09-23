package routes

import (
	"github.com/gin-gonic/gin"
)

// InitRoutes initializes all routes for the application
func InitRoutes() *gin.Engine {
	r := gin.Default()

	// Load individual route groups
	initializeAdminRoutes(r)
	initializeParentRoutes(r)
	initializeStandRoutes(r)
	initializeUserRoutes(r)
	initializeChatRoutes(r)
	initializePaymentRoutes(r)
	initializeStatisticsRoutes(r)

	return r
}
