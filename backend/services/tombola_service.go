package services

import (
	"errors"
	"math/rand"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
)

func CreateTombola(tombola models.Tombola) error {
	if err := database.DB.Create(&tombola).Error; err != nil {
		return err
	}
	return nil
}

func BuyTicket(tombolaID, userID uint) error {
	ticket := models.Ticket{
		TombolaID: tombolaID,
		UserID:    userID,
		Number:    rand.Intn(1000000), // Générer un numéro aléatoire
	}

	if err := database.DB.Create(&ticket).Error; err != nil {
		return err
	}
	return nil
}

func DrawTombola(tombolaID uint) (*models.User, error) {
	var tombola models.Tombola
	if err := database.DB.Preload("Tickets").First(&tombola, tombolaID).Error; err != nil {
		return nil, errors.New("Tombola non trouvée")
	}

	if len(tombola.Tickets) == 0 {
		return nil, errors.New("Aucun ticket disponible")
	}

	// Sélectionner un ticket gagnant au hasard
	rand.Seed(time.Now().UnixNano())
	winnerTicket := tombola.Tickets[rand.Intn(len(tombola.Tickets))]

	var winner models.User
	if err := database.DB.First(&winner, winnerTicket.UserID).Error; err != nil {
		return nil, errors.New("Utilisateur gagnant non trouvé")
	}

	return &winner, nil
}
func AddLot(tombolaID uint, lot models.Lot) error {
	lot.TombolaID = tombolaID
	if err := database.DB.Create(&lot).Error; err != nil {
		return err
	}
	return nil
}
