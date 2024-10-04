package database

import (
	"log"

	"github.com/dratsisama/Kermisys/backend/models"
)

func MigrateModels() {
	err := DB.AutoMigrate(
		// Liste de tous les modèles à migrer
		&models.User{},
		&models.ParentChild{},
		&models.Kermesse{},
		&models.Stand{},
		&models.StandInteraction{},
		&models.Token{},
		&models.Transaction{},
		&models.TombolaTicket{},
		&models.TombolaLot{},
		&models.TombolaDraw{},
		&models.PlayerScore{},
		&models.ParentChildRequest{},
		&models.ChatMessage{},
	)

	if err != nil {
		log.Fatalf("Erreur lors de la migration des modèles : %v", err)
	}

	log.Println("Migrations terminées avec succès.")
}
