package main

import (
	"log"
	"net/http"

	"github.com/dratsisama/Kermisys/backend/config"
	"github.com/dratsisama/Kermisys/backend/database"
	_ "github.com/dratsisama/Kermisys/backend/docs"
	"github.com/dratsisama/Kermisys/backend/routes"
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"     // Importation des fichiers Swagger
	ginSwagger "github.com/swaggo/gin-swagger" // Importation de gin-swagger
)

// @title           Kermisys API Documentation
// @version         1.0
// @description     Documentation de l'API pour la gestion des kermesses scolaires avec fonctionnalités de stand, tombola, utilisateurs, etc.

// @contact.name    Dratsi Sama
// @contact.url     http://dratsisama.com
// @contact.email   contact@dratsisama.com

// @license.name    MIT License
// @license.url     https://opensource.org/licenses/MIT

// @host            localhost:8080
// @BasePath        /

// @securityDefinitions.apikey ApiKeyAuth
// @in header
// @name Authorization

func main() {
	// Charger les configurations
	config.LoadConfig()

	// Initialiser la base de données
	database.Connect()

	// Effectuer les migrations
	database.Migrate()

	// Insérer les données par défaut
	database.SeedDatabase()

	// Initialiser Gin
	router := gin.Default()

	// Configurer la documentation Swagger
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	// Configurer les autres routes de l'application
	routes.InitRoutes()

	// Route de bienvenue à la racine de l'API
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Bienvenue sur Kermisys Backend",
		})
	})

	// Démarrer le serveur sur le port 8080
	log.Fatal(router.Run(":8080"))
}
