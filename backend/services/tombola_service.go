package services

import (
	"errors"
	"math/rand"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
)

func CreateTombola(userID uint, kermesseID uint) (*models.Tombola, error) {
	tombola := models.Tombola{
		Name:       `Nouvelle Tombola ${kermesseID}`,
		KermesseID: kermesseID,
		CreatedAt:  time.Now(),
		UpdatedAt:  time.Now(),
	}

	if err := database.DB.Create(&tombola).Error; err != nil {
		return nil, err
	}
	return &tombola, nil
}

// Permet uniquement la mise à jour du nom et de l'ID de la kermesse
func UpdateTombola(tombolaID uint, updatedTombola models.Tombola) error {
	return database.DB.Model(&models.Tombola{}).Where("id = ?", tombolaID).
		Updates(map[string]interface{}{
			"name":        updatedTombola.Name,
			"kermesse_id": updatedTombola.KermesseID,
		}).Error
}

func DeleteTombola(tombolaID uint) error {
	return database.DB.Delete(&models.Tombola{}, tombolaID).Error
}

func AddLot(tombolaID uint, lot models.Lot) error {
	lot.TombolaID = tombolaID
	return database.DB.Create(&lot).Error
}

func RemoveLot(tombolaID, lotID uint) error {
	return database.DB.Where("tombola_id = ? AND id = ?", tombolaID, lotID).Delete(&models.Lot{}).Error
}

func GetTombola(tombolaID uint) (*models.Tombola, error) {
	var tombola models.Tombola
	err := database.DB.Preload("Lots").Preload("Tickets").First(&tombola, tombolaID).Error
	if err != nil {
		return nil, err
	}
	return &tombola, nil
}

// Tirage au sort d'un ticket aléatoire et attribution d'un lot au gagnant
func DrawTombola(tombolaID uint) (*models.User, *models.Lot, error) {
	var tombola models.Tombola
	if err := database.DB.Preload("Tickets").Preload("Lots").First(&tombola, tombolaID).Error; err != nil {
		return nil, nil, errors.New("Tombola non trouvée")
	}

	// Filtrer les tickets non gagnants
	var availableTickets []models.Ticket
	for _, ticket := range tombola.Tickets {
		if !ticket.Winner {
			availableTickets = append(availableTickets, ticket)
		}
	}

	if len(availableTickets) == 0 {
		return nil, nil, errors.New("Aucun ticket disponible")
	}

	// Sélectionner un ticket gagnant au hasard
	rand.Seed(time.Now().UnixNano())
	winnerTicket := availableTickets[rand.Intn(len(availableTickets))]

	// Récupérer l'utilisateur gagnant
	var winner models.User
	if err := database.DB.First(&winner, winnerTicket.UserID).Error; err != nil {
		return nil, nil, errors.New("Utilisateur gagnant non trouvé")
	}

	// Marquer le ticket comme gagnant
	winnerTicket.Winner = true
	if err := database.DB.Save(&winnerTicket).Error; err != nil {
		return nil, nil, err
	}

	// Sélectionner un lot au hasard
	rand.Seed(time.Now().UnixNano())
	wonLot := tombola.Lots[rand.Intn(len(tombola.Lots))]

	// Réduire la quantité du lot
	if wonLot.Quantity > 0 {
		wonLot.Quantity -= 1
		if err := database.DB.Save(&wonLot).Error; err != nil {
			return nil, nil, err
		}
	} else {
		return nil, nil, errors.New("Pas de lot disponible")
	}

	return &winner, &wonLot, nil
}

func IsTombolaOrganisateur(tombolaID, userID uint) bool {
	var tombola models.Tombola
	database.DB.Preload("Organisateurs").First(&tombola, tombolaID)
	for _, org := range tombola.Organisateurs {
		if org.ID == userID {
			return true
		}
	}
	return false
}

func BuyTombolaTicket(tombolaID, userID, kermesseID uint) error {
	// Vérifier si l'utilisateur a déjà acheté un ticket pour cette tombola/kermesse
	var existingTicket models.Ticket
	err := database.DB.Where("user_id = ? AND tombola_id = ? AND kermesse_id = ?", userID, tombolaID, kermesseID).First(&existingTicket).Error
	if err == nil {
		return errors.New("Vous avez déjà acheté un ticket pour cette tombola")
	}

	// Créer le ticket
	ticket := models.Ticket{
		UserID:     userID,
		TombolaID:  tombolaID,
		KermesseID: kermesseID,
		Winner:     false,
	}
	return database.DB.Create(&ticket).Error
}
