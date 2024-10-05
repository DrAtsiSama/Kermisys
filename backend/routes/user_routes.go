package routes

import (
	"github.com/dratsisama/Kermisys/backend/controllers"
	"github.com/dratsisama/Kermisys/backend/middlewares"
	"github.com/gin-gonic/gin"
)

func initializeUserRoutes(r *gin.RouterGroup) {
	userRoutes := r.Group("/user")
	{
		// General user routes
		userRoutes.GET("/:username", middlewares.RoleMiddleware("admin", "organisateur"), controllers.GetUserHandler)
		userRoutes.POST("/", middlewares.RoleMiddleware("admin", "organisateur"), controllers.CreateUserHandler)

		userRoutes.POST("/parent-requests", controllers.CreateParentChildRequest)           // Créer une demande parent-enfant
		userRoutes.PUT("/parent-requests/accept/:id", controllers.AcceptParentChildRequest) // Accepter une demande
		userRoutes.PUT("/parent-requests/reject/:id", controllers.RejectParentChildRequest) // Rejeter une demande
		userRoutes.GET("/parent-requests/requests", controllers.ListParentChildRequests)    // Liste des demandes parent-enfant
		userRoutes.GET("/children", controllers.ListChildrenHandler)                        // Liste des enfants d'un parent
		userRoutes.DELETE("/children/:child_id", middlewares.RoleMiddleware("parent"), controllers.RemoveChildHandler)
		userRoutes.GET("/tokens", controllers.GetUserTokens)
	}
}
