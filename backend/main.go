package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

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

// @contact.name    Dr_AtsiSama
// @contact.url     http://dratsisama.com
// @contact.email   contact@dratsisama.com

// @license.name    MIT License
// @license.url     https://opensource.org/licenses/MIT

// @BasePath        /

// @securityDefinitions.apikey Bearer
// @in header
// @name Authorization

func main() {
	// Charger les configurations
	config.LoadConfig()
	// Charger la config de Stripe
	config.InitStripe()
	// Initialiser la base de données
	database.Connect()

	// Effectuer les migrations
	database.Migrate()

	// Insérer les données par défaut
	database.SeedDatabase()

	// Initialiser Gin
	router := routes.InitRoutes()

	// Récupérer BASE_URL et BASE_PORT du fichier .env
	baseURL := os.Getenv("BASE_URL")
	if baseURL == "" {
		log.Fatal("BASE_URL n'est pas défini dans le fichier .env")
	}

	// Récupérer SERVER_URL
	serverURL := os.Getenv("SERVER_URL")
	if serverURL == "" {
		log.Fatal("SERVER_URL n'est pas défini dans le fichier .env")
	}

	basePort := os.Getenv("BASE_URL")
	if basePort == "" {
		log.Fatal("BASE_PORT n'est pas défini dans le fichier .env")
	}

	// Configurer la documentation Swagger avec le BASE_URL
	swaggerURL := fmt.Sprintf("http://%s:%s/swagger/doc.json", serverURL, basePort)
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler, ginSwagger.URL(swaggerURL), ginSwagger.PersistAuthorization(true)))

	// Route de bienvenue à la racine de l'API
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Bienvenue sur Kermisys Backend",
		})
	})

	// Démarrer le serveur sur l'adresse et le port récupérés
	serverAddress := fmt.Sprintf("%s:%s", baseURL, basePort)
	log.Printf("Server running at %s", serverAddress)
	log.Fatal(router.Run(serverAddress))
}
