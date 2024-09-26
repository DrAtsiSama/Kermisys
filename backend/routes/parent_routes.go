package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/gin-gonic/gin"
)

func initializeParentRoutes(r *gin.RouterGroup) {
	parentRoutes := r.Group("/parent")
	{
		// Parents can buy and distribute tokens
		parentRoutes.POST("/buy-tokens", controllers.BuyTokens)
		parentRoutes.POST("/distribute-tokens", controllers.DistributeTokens)
		// parentRoutes.GET("/view-children", controllers.ViewChildren)
	}
}
