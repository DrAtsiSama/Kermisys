package services

import (
	"errors"

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
	if err := database.DB.First(&stand, id).Error; err != nil {
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
	if err := database.DB.Delete(&models.Stand{}, id).Error; err != nil {
		return err
	}
	return nil
}

// GetAllStands récupère tous les stands
func GetAllStands() ([]models.Stand, error) {
	var stands []models.Stand
	if err := database.DB.Find(&stands).Error; err != nil {
		return nil, err
	}
	return stands, nil
}

var standStock = make(map[string]int)

func InteractWithStand(username string, stand string, tokens int) error {
	if standStock[stand] <= 0 {
		return errors.New("insufficient stock")
	}
	standStock[stand] -= 1
	return nil
}
