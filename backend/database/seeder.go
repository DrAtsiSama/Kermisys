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

	// Créer des utilisateurs, y compris admin atsi et gérants
	users := []models.User{
		{Username: "atsi", PasswordHash: "hashed_atsi", Email: "atsi@example.com", Role: "admin"},
		{Username: "parent1", PasswordHash: "hashed_password", Email: "parent1@example.com", Role: "parent"},
		{Username: "parent2", PasswordHash: "hashed_password", Email: "parent2@example.com", Role: "parent"},
		{Username: "enfant1", PasswordHash: "hashed_password", Email: "enfant1@example.com", Role: "eleve"},
		{Username: "enfant2", PasswordHash: "hashed_password", Email: "enfant2@example.com", Role: "eleve"},
		{Username: "enfant3", PasswordHash: "hashed_password", Email: "enfant3@example.com", Role: "eleve"},
		{Username: "gerant1", PasswordHash: "hashed_password", Email: "gerant1@example.com", Role: "gerant_kermesse"},
		{Username: "gerant2", PasswordHash: "hashed_password", Email: "gerant2@example.com", Role: "gerant_stand"},
	}
	DB.Create(&users)

	// Créer des kermesses gérées par des gérants
	kermesses := []models.Kermesse{
		{Name: "Kermesse de Printemps", Location: "École A", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 1, 0), Organisateurs: []models.User{users[6]}},
		{Name: "Kermesse d'Été", Location: "École B", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 2, 0), Organisateurs: []models.User{users[6]}},
		{Name: "Kermesse d'Hiver", Location: "École C", StartDate: time.Now(), EndDate: time.Now().AddDate(0, 3, 0), Organisateurs: []models.User{users[6]}},
	}
	DB.Create(&kermesses)

	// Associer des participants aux kermesses
	for _, kermesse := range kermesses {
		kermesse.Participants = append(kermesse.Participants, users[1], users[2])
		DB.Save(&kermesse)
	}

	// Créer des stands gérés par des gérants
	for _, kermesse := range kermesses {
		stands := []models.Stand{
			{KermesseID: kermesse.ID, Type: "nourriture", Name: "Stand de Hot-dogs", Stock: 100, OwnerID: users[7].ID},
			{KermesseID: kermesse.ID, Type: "boisson", Name: "Stand de Sodas", Stock: 200, OwnerID: users[7].ID},
		}
		DB.Create(&stands)
	}

	// Créer des lots de tombola
	lots := []models.TombolaLot{
		{KermesseID: kermesses[0].ID, Description: "Vélo tout-terrain", Quantity: 1},
		{KermesseID: kermesses[0].ID, Description: "Tablette tactile", Quantity: 2},
	}
	DB.Create(&lots)

	// Associer des enfants aux parents
	parentChild := []models.ParentChild{
		{ParentID: users[1].ID, ChildID: users[3].ID},
		{ParentID: users[1].ID, ChildID: users[4].ID},
		{ParentID: users[2].ID, ChildID: users[5].ID},
	}
	DB.Create(&parentChild)

	// Créer des achats de jetons
	tokens := []models.Token{
		{UserID: users[1].ID, Amount: 100, PurchasedAt: time.Now()},
		{UserID: users[2].ID, Amount: 150, PurchasedAt: time.Now()},
	}
	DB.Create(&tokens)

	// Créer des faux messages de chat
	messages := []models.ChatMessage{
		{SenderID: "atsi", ReceiverID: "parent1", Content: "Bonjour, comment allez-vous?", Timestamp: time.Now()},
		{SenderID: "parent1", ReceiverID: "atsi", Content: "Très bien, merci!", Timestamp: time.Now()},
	}
	DB.Create(&messages)

	// Créer des scores de jeu
	playerScores := []models.PlayerScore{
		{UserID: users[3].ID, StandID: 1, Score: 100, CreatedAt: time.Now()},
		{UserID: users[4].ID, StandID: 2, Score: 120, CreatedAt: time.Now()},
	}
	DB.Create(&playerScores)

	// Créer des interactions aux stands
	interactions := []models.StandInteraction{
		{UserID: users[1].ID, StandID: 1, Action: "buy_item", Item: "Hot-dog", Quantity: 2, CreatedAt: time.Now()},
		{UserID: users[2].ID, StandID: 2, Action: "buy_item", Item: "Soda", Quantity: 3, CreatedAt: time.Now()},
	}
	DB.Create(&interactions)

	// Créer des transactions
	transactions := []models.Transaction{
		{StandID: 1, UserID: users[1].ID, KermesseID: kermesses[0].ID, Currency: "EUR", Status: "completed", PaymentIntent: "pi_xxx", Amount: 500, Timestamp: time.Now()},
		{StandID: 2, UserID: users[2].ID, KermesseID: kermesses[1].ID, Currency: "EUR", Status: "completed", PaymentIntent: "pi_yyy", Amount: 300, Timestamp: time.Now()},
	}
	DB.Create(&transactions)

	// Ajouter des tickets de tombola
	tickets := []models.TombolaTicket{
		{UserID: users[3].ID, KermesseID: kermesses[0].ID, Amount: 2, PurchasedAt: time.Now()},
		{UserID: users[4].ID, KermesseID: kermesses[1].ID, Amount: 1, PurchasedAt: time.Now()},
	}
	DB.Create(&tickets)

	// Créer des tirages de tombola
	draws := []models.TombolaDraw{
		{KermesseID: kermesses[0].ID, UserID: users[3].ID, LotID: lots[0].ID, DrawDate: time.Now()},
		{KermesseID: kermesses[0].ID, UserID: users[4].ID, LotID: lots[1].ID, DrawDate: time.Now()},
	}
	DB.Create(&draws)

	// Créer des demandes parent-enfant pour l'utilisateur avec l'ID 34
	parentChildRequests := []models.ParentChildRequest{
		{ParentID: 1, ChildID: users[4].ID, Status: "pending", CreatedAt: time.Now()},
		{ParentID: 1, ChildID: users[5].ID, Status: "pending", CreatedAt: time.Now()},
		{ParentID: 1, ChildID: users[6].ID, Status: "pending", CreatedAt: time.Now()},
	}
	DB.Create(&parentChildRequests)

	// Créer des statistiques de kermesse
	kermesseStats := []models.KermesseStats{
		{KermesseID: kermesses[0].ID, TotalParticipants: 100, TotalTokensUsed: 1000, TotalRevenue: 2000.00, CreatedAt: time.Now(), UpdatedAt: time.Now()},
		{KermesseID: kermesses[1].ID, TotalParticipants: 200, TotalTokensUsed: 1500, TotalRevenue: 2500.00, CreatedAt: time.Now(), UpdatedAt: time.Now()},
	}
	DB.Create(&kermesseStats)

	// Créer des statistiques de stand
	standStats := []models.StandStats{
		{StandID: 1, TotalTokensUsed: 500, ItemsSold: 50, Revenue: 1000.00, CreatedAt: time.Now(), UpdatedAt: time.Now()},
		{StandID: 2, TotalTokensUsed: 300, ItemsSold: 30, Revenue: 800.00, CreatedAt: time.Now(), UpdatedAt: time.Now()},
	}
	DB.Create(&standStats)

	// Créer des statistiques d'organisateur
	organisateurStats := models.OrganisateurStats{
		OrganisateurID: users[6].ID, TotalKermesses: 3, TotalRevenue: 5000.00, CreatedAt: time.Now(), UpdatedAt: time.Now(),
	}
	DB.Create(&organisateurStats)

	log.Println("Insertion des données par défaut terminée.")
}
