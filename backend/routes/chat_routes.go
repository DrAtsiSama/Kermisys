package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeChatRoutes(r *gin.Engine) {
	chatRoutes := r.Group("/chat")
	{
		// WebSocket chat route
		chatRoutes.GET("/connect", controllers.ChatHandler)
	}
}
