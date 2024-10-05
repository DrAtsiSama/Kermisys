package services

import (
	"errors"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"gorm.io/gorm"
)

var userTokens = make(map[string]int)

func AchatJetons(userID uint, amount int) error {
	var existingToken models.Token

	// Vérifier si l'utilisateur a déjà des jetons
	if err := database.DB.Where("user_id = ?", userID).First(&existingToken).Error; err != nil {
		// Si aucun jeton n'existe pour cet utilisateur, créer une nouvelle entrée
		if err == gorm.ErrRecordNotFound {
			// Créer une nouvelle entrée de jetons pour l'utilisateur
			newToken := models.Token{
				UserID:      userID,
				Amount:      amount,
				PurchasedAt: time.Now(),
			}
			// Enregistrer les nouveaux jetons dans la base de données
			if err := database.DB.Create(&newToken).Error; err != nil {
				return err
			}
		} else {
			// Gérer toute autre erreur lors de la récupération des jetons
			return err
		}
	} else {
		// Si des jetons existent déjà, ajouter le montant acheté à l'existant
		existingToken.Amount += amount
		if err := database.DB.Save(&existingToken).Error; err != nil {
			return err
		}
	}

	return nil
}

func ProcessPaymentDemo(userID int, amount int) bool {
	return true // Retourner true pour un paiement réussi
}

func DistributeTokens(parent string, child string, amount int) error {
	// Vérifier si le parent a suffisamment de jetons
	var parentUser models.User
	if err := database.DB.Where("username = ?", parent).First(&parentUser).Error; err != nil {
		return errors.New("Parent non trouvé")
	}

	// Calculer le total des jetons du parent
	var totalTokens int
	database.DB.Model(&models.Token{}).Where("user_id = ?", parentUser.ID).Select("SUM(amount)").Scan(&totalTokens)

	if totalTokens < amount {
		return errors.New("Jetons insuffisants")
	}

	// Vérifier que l'enfant appartient bien à ce parent
	if !IsChildOfParent(parent, child) {
		return errors.New("L'enfant n'appartient pas au parent")
	}

	// Réduire les jetons du parent en ajustant les entrées dans la table Token
	err := AdjustTokenAmount(parentUser.ID, -amount)
	if err != nil {
		return err
	}

	// Ajouter les jetons à l'enfant
	var childUser models.User
	if err := database.DB.Where("username = ?", child).First(&childUser).Error; err != nil {
		return errors.New("Enfant non trouvé")
	}
	err = AdjustTokenAmount(childUser.ID, amount)
	if err != nil {
		return err
	}

	return nil
}

// AdjustTokenAmount ajuste la quantité de jetons d'un utilisateur
func AdjustTokenAmount(userID uint, amount int) error {

	if amount == 0 {
		return nil
	}

	// Si le montant est négatif, il faut retirer les jetons
	if amount < 0 {
		// Parcourir les entrées Token de l'utilisateur et les diminuer en conséquence
		var tokens []models.Token
		if err := database.DB.Where("user_id = ?", userID).Find(&tokens).Error; err != nil {
			return err
		}

		for _, token := range tokens {
			if -amount <= token.Amount {
				// Si l'entrée a suffisamment de jetons, on les réduit
				token.Amount += amount // amount est négatif
				database.DB.Save(&token)
				break
			} else {
				// Sinon, on retire l'entrée et on continue à réduire le reste
				amount += token.Amount // amount est négatif
				database.DB.Delete(&token)
			}
		}
	} else {
		// Si le montant est positif, on ajoute simplement une nouvelle entrée dans Token
		token := models.Token{
			UserID:      userID,
			Amount:      amount,
			PurchasedAt: time.Now(),
		}
		if err := database.DB.Create(&token).Error; err != nil {
			return err
		}
	}

	return nil
}

func IsChildOfParent(parentUsername string, childUsername string) bool {
	var parent models.User
	if err := database.DB.Where("username = ?", parentUsername).First(&parent).Error; err != nil {
		return false
	}

	var child models.User
	if err := database.DB.Where("username = ?", childUsername).First(&child).Error; err != nil {
		return false
	}

	// Vérifier s'il existe une relation parent-enfant
	var parentChild models.ParentChild
	if err := database.DB.Where("parent_id = ? AND child_id = ?", parent.ID, child.ID).First(&parentChild).Error; err != nil {
		return false
	}

	return true
}
