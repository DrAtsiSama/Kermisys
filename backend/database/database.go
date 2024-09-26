package database

import (
	"fmt"
	"log"
	"os"

	"github.com/dratsisama/Kermisys/backend/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

// Connect se connecte à la base de données PostgreSQL
func Connect() {
	// Construire la chaîne de connexion à partir des variables d'environnement
	host := os.Getenv("DB_HOST")
	user := os.Getenv("DB_USER")
	password := os.Getenv("DB_PASSWORD")
	dbname := os.Getenv("DB_NAME")
	port := os.Getenv("DB_PORT")

	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s dbname=%s port=%s sslmode=disable",
		host, user, password, dbname, port,
	)

	var err error
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalf("Impossible de se connecter à la base de données: %v", err)
	}

	log.Println("Connexion à la base de données réussie.")
}

// Migrate exécute les migrations pour créer les tables dans la base de données
func Migrate() {
	// Importer les modèles à migrer
	err := DB.AutoMigrate(
		&models.User{},
		&models.ParentChild{},
		&models.Kermesse{},
		&models.Stand{},
		&models.Token{},
		&models.Transaction{},
		&models.TombolaTicket{},
		&models.TombolaLot{},
		&models.TombolaDraw{},
		&models.KermesseStats{},
		&models.StandStats{},
		&models.OrganisateurStats{},
	)

	if err != nil {
		log.Fatalf("Erreur lors de la migration des modèles : %v", err)
	}

	log.Println("Migrations terminées avec succès.")
}
