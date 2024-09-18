package routes

import (
    "github.com/gin-gonic/gin"
    "kermisys/controllers"
)

func SetupRouter() *gin.Engine {
    router := gin.Default()

    // Exemple de route utilisateur
    router.GET("/users", controllers.GetUsers)

    return router
}
