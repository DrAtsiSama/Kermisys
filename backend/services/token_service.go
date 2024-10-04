package services

import (
	"errors"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
)

var userTokens = make(map[string]int)

func AchatJetons(userID uint, amount int) error {
	var user models.User
	if err := database.DB.First(&user, userID).Error; err != nil {
		return errors.New("Utilisateur non trouvé")
	}

	jeton := models.Token{
		Amount: amount,
		UserID: userID,
	}

	// Enregistrer les jetons
	if err := database.DB.Create(&jeton).Error; err != nil {
		return err
	}

	return nil
}

func DistributeTokens(parent string, child string, amount int) error {
	if userTokens[parent] < amount {
		return errors.New("insufficient tokens")
	}
	userTokens[parent] -= amount
	userTokens[child] += amount
	return nil
}
