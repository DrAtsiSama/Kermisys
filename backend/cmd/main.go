package main

import (
    "github.com/gin-gonic/gin"
    "log"
    "net/http"
)

func main() {
    router := gin.Default()

    router.GET("/", func(c *gin.Context) {
        c.JSON(http.StatusOK, gin.H{
            "message": "Bienvenue sur Kermisys Backend",
        })
    })

    log.Fatal(router.Run(":8080")) // Le serveur écoute sur le port 8080
}
