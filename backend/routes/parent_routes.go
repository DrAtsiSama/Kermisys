package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeParentRoutes(r *gin.RouterGroup) {
	parentRoutes := r.Group("/parent")
	{
		// Parents can buy and distribute tokens
		parentRoutes.POST("/achat/:user_id", middlewares.RoleMiddleware("admin", "organisateur", "parent"), controllers.AchatJetons)
		parentRoutes.POST("/distribute-tokens", middlewares.RoleMiddleware("admin", "organisateur", "parent"), controllers.DistributeTokens)
		// parentRoutes.GET("/view-children", controllers.ViewChildren)
	}
}
