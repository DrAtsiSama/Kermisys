package services

import (
	"errors"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
)

// CreateStand ajoute un nouveau stand à la base de données
func CreateStand(stand *models.Stand) error {
	return database.DB.Create(stand).Error
}

// GetStand récupère un stand par son ID
func GetStand(id uint) (models.Stand, error) {
	var stand models.Stand
	if err := database.DB.Preload("Kermesse").Preload("Owner").First(&stand, id).Error; err != nil {
		return stand, err
	}
	return stand, nil
}

// UpdateStand met à jour un stand existant
func UpdateStand(stand *models.Stand) error {
	return database.DB.Save(stand).Error
}

// DeleteStand supprime un stand par son ID
func DeleteStand(id uint) error {
	var stand models.Stand

	// Vérifier si le stand existe
	if err := database.DB.Unscoped().First(&stand, id).Error; err != nil {
		return errors.New("Stand not found")
	}

	// Supprimer le stand
	if err := database.DB.Unscoped().Delete(&stand).Error; err != nil {
		return err
	}

	return nil
}

// GetAllStands récupère tous les stands avec pagination
func GetAllStands(page, limit int) ([]models.Stand, error) {
	var stands []models.Stand
	offset := (page - 1) * limit
	if err := database.DB.Preload("Kermesse").Preload("Owner").Offset(offset).Limit(limit).Find(&stands).Error; err != nil {
		return nil, err
	}
	return stands, nil
}

// InteractWithStand permet à un utilisateur de jouer ou d'acheter un objet à un stand
func InteractWithStand(userID, standID uint, action, item string, quantity, score int) error {
	var stand models.Stand
	if err := database.DB.First(&stand, standID).Error; err != nil {
		return errors.New("Stand not found")
	}

	// Validation de l'action
	if action != "play_game" && action != "buy_item" && action != "add_stock" && action != "remove_stock" {
		return errors.New("Invalid action")
	}

	// Enregistrer l'interaction
	interaction := models.StandInteraction{
		UserID:    userID,
		StandID:   standID,
		Action:    action,
		Item:      item,
		Quantity:  quantity,
		Score:     score,
		CreatedAt: time.Now(),
	}

	// Gestion des actions
	switch action {
	case "play_game":
		if score > stand.Stock {
			return errors.New("Not enough stock for this game")
		}
		stand.Stock -= score
	case "buy_item":
		if stand.Stock < quantity {
			return errors.New("Not enough stock")
		}
		stand.Stock -= quantity
	case "add_stock":
		stand.Stock += quantity
	case "remove_stock":
		if stand.Stock < quantity {
			return errors.New("Not enough stock")
		}
		stand.Stock -= quantity
	}

	// Enregistrer les modifications du stand
	if err := database.DB.Save(&stand).Error; err != nil {
		return err
	}

	// Sauvegarder l'interaction dans la base de données
	if err := database.DB.Create(&interaction).Error; err != nil {
		return err
	}

	return nil
}
