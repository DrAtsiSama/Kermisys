package main

import (
	"log"
	"net/http"

	"github.com/dratsisama/Kermisys/backend/config"
	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/routes"
	"github.com/gin-gonic/gin"
)

func main() {
	// Charger les configurations
	config.LoadConfig()
	// Initialiser la base de données
	database.Connect()
	database.Migrate()

	router := routes.InitRoutes()

	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Bienvenue sur Kermisys Backend",
		})
	})

	log.Fatal(router.Run(":8080")) // Le serveur écoute sur le port 8080
}
