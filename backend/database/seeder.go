package database

import (
	"log"
	"time"

	"github.com/dratsisama/Kermisys/backend/models"
)

// SeedDatabase insère les données par défaut dans la base de données
func SeedDatabase() {
	// Vérifier si la base de données est déjà peuplée
	var count int64
	DB.Model(&models.Kermesse{}).Count(&count)
	if count > 0 {
		log.Println("Les données de la base de données existent déjà, saut de l'initialisation.")
		return
	}

	log.Println("Insertion des données par défaut...")

	// Créer des kermesses
	kermesses := []models.Kermesse{
		{Name: "Kermesse de Printemps", Location: "École A", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 1, 0)},
		{Name: "Kermesse d'Été", Location: "École B", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 2, 0)},
		{Name: "Kermesse d'Hiver", Location: "École C", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 3, 0)},
	}
	DB.Create(&kermesses)

	// Créer des stands pour chaque kermesse
	for _, kermesse := range kermesses {
		stands := []models.Stand{
			{KermesseID: kermesse.ID, Type: "nourriture", Name: "Stand de Hot-dogs", Stock: 100, OwnerID: 1},
			{KermesseID: kermesse.ID, Type: "boisson", Name: "Stand de Sodas", Stock: 200, OwnerID: 2},
			{KermesseID: kermesse.ID, Type: "activité", Name: "Château Gonflable", Stock: 0, OwnerID: 3},
			{KermesseID: kermesse.ID, Type: "nourriture", Name: "Stand de Crêpes", Stock: 150, OwnerID: 4},
			{KermesseID: kermesse.ID, Type: "boisson", Name: "Stand de Smoothies", Stock: 120, OwnerID: 5},
		}
		DB.Create(&stands)
	}

	// Créer des lots de tombola pour la première kermesse
	lots := []models.TombolaLot{
		{KermesseID: kermesses[0].ID, Description: "Vélo tout-terrain", Quantity: 1},
		{KermesseID: kermesses[0].ID, Description: "Tablette tactile", Quantity: 2},
		{KermesseID: kermesses[0].ID, Description: "Peluche géante", Quantity: 3},
		{KermesseID: kermesses[0].ID, Description: "Bon d'achat de 50€", Quantity: 5},
		{KermesseID: kermesses[0].ID, Description: "Console de jeux", Quantity: 1},
		{KermesseID: kermesses[0].ID, Description: "Entrée au parc d'attractions", Quantity: 2},
		{KermesseID: kermesses[0].ID, Description: "Coffret gourmand", Quantity: 3},
	}
	DB.Create(&lots)

	// Créer des utilisateurs parents et enfants
	parents := []models.User{
		{Username: "parent1", PasswordHash: "hashed_password", Email: "parent1@example.com", Role: "parent"},
		{Username: "parent2", PasswordHash: "hashed_password", Email: "parent2@example.com", Role: "parent"},
	}
	DB.Create(&parents)

	children := []models.User{
		{Username: "enfant1", PasswordHash: "hashed_password", Email: "enfant1@example.com", Role: "eleve"},
		{Username: "enfant2", PasswordHash: "hashed_password", Email: "enfant2@example.com", Role: "eleve"},
		{Username: "enfant3", PasswordHash: "hashed_password", Email: "enfant3@example.com", Role: "eleve"},
	}
	DB.Create(&children)

	// Associer les enfants aux parents
	parentChild := []models.ParentChild{
		{ParentID: parents[0].ID, ChildID: children[0].ID},
		{ParentID: parents[0].ID, ChildID: children[1].ID},
		{ParentID: parents[1].ID, ChildID: children[2].ID},
	}
	DB.Create(&parentChild)

	// Ajouter des jetons pour les parents et les enfants
	tokens := []models.Token{
		{UserID: parents[0].ID, Amount: 100, PurchasedAt: time.Now()},
		{UserID: parents[1].ID, Amount: 150, PurchasedAt: time.Now()},
		{UserID: children[0].ID, Amount: 50, PurchasedAt: time.Now()},
		{UserID: children[1].ID, Amount: 30, PurchasedAt: time.Now()},
		{UserID: children[2].ID, Amount: 20, PurchasedAt: time.Now()},
	}
	DB.Create(&tokens)

	// Ajouter des transactions pour les parents
	transactions := []models.Transaction{
		{StandID: 1, UserID: parents[0].ID, Amount: 10, Timestamp: time.Now()},
		{StandID: 2, UserID: parents[1].ID, Amount: 15, Timestamp: time.Now()},
	}
	DB.Create(&transactions)

	// Ajouter des tickets de tombola pour les enfants
	tickets := []models.TombolaTicket{
		{UserID: children[0].ID, KermesseID: kermesses[0].ID, Amount: 2, PurchasedAt: time.Now()},
		{UserID: children[1].ID, KermesseID: kermesses[0].ID, Amount: 1, PurchasedAt: time.Now()},
		{UserID: children[2].ID, KermesseID: kermesses[0].ID, Amount: 3, PurchasedAt: time.Now()},
	}
	DB.Create(&tickets)

	log.Println("Insertion des données par défaut terminée.")
}
