package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeChatRoutes(r *gin.RouterGroup) {
	chatRoutes := r.Group("/ws")
	{
		// WebSocket chat route
		chatRoutes.GET("/private", controllers.ChatHandler)
	}
}
