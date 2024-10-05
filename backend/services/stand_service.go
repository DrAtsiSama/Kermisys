package services

import (
	"errors"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"gorm.io/gorm"
)

// CreateStand ajoute un nouveau stand et donne le rôle gérant_stand au créateur si ce n'est pas déjà le cas
func CreateStand(stand *models.Stand) error {
	var owner models.User
	// Vérifier si le propriétaire du stand existe
	if err := database.DB.First(&owner, stand.OwnerID).Error; err != nil {
		return errors.New("Propriétaire non trouvé")
	}

	// Vérifier si l'utilisateur est déjà gérant de stand, organisateur ou admin
	if owner.Role != "gerant_stand" && owner.Role != "organisateur" && owner.Role != "admin" {
		// Attribuer le rôle gérant de stand
		owner.Role = "gerant_stand"
		if err := database.DB.Save(&owner).Error; err != nil {
			return errors.New("Impossible de mettre à jour le rôle de l'utilisateur")
		}
	}

	// Ajouter les champs automatiques pour la création du stand
	stand.CreatedAt = time.Now()
	stand.UpdatedAt = time.Now()

	// Sauvegarder le stand dans la base de données
	if err := database.DB.Create(stand).Error; err != nil {
		return errors.New("Erreur lors de la création du stand")
	}

	return nil
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

// InteractWithStand permet à un utilisateur d'interagir avec un stand spécifique
func InteractWithStand(userID, standID uint, action, item string, quantity, score int) error {
	var stand models.Stand
	if err := database.DB.Preload("Kermesse.Organisateurs").First(&stand, standID).Error; err != nil {
		return errors.New("Stand not found")
	}

	// Vérifier si l'utilisateur est inscrit à la kermesse
	if !isUserRegisteredForKermesse(userID, stand.KermesseID) {
		return errors.New("User is not registered for this kermesse")
	}

	// Validation de l'action
	if action != "play_game" && action != "buy_item" && action != "add_stock" && action != "remove_stock" {
		return errors.New("Invalid action")
	}

	// Déduire les jetons de l'utilisateur pour les actions "play_game" et "buy_item"
	if action == "play_game" || action == "buy_item" {
		if err := DeductUserTokens(userID, quantity); err != nil {
			return err
		}
	}

	// Gestion des actions sur le stock du stand
	switch action {
	case "play_game":
		if score > stand.Stock {
			return errors.New("Not enough stock for this game")
		}
		stand.Stock -= score
		UpdateStandStats(standID, 0, 0, float64(quantity)/10)
		UpdateKermesseStats(stand.KermesseID, 0, quantity, float64(quantity)/10)
	case "buy_item":
		if stand.Stock < quantity {
			return errors.New("Not enough stock")
		}
		stand.Stock -= quantity
		UpdateStandStats(standID, quantity*10, quantity, float64(quantity)/10)
		UpdateKermesseStats(stand.KermesseID, 0, quantity, float64(quantity)/10)
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

	// Enregistrer l'interaction dans la base de données
	interaction := models.StandInteraction{
		UserID:    userID,
		StandID:   standID,
		Action:    action,
		Item:      item,
		Quantity:  quantity,
		Score:     score,
		CreatedAt: time.Now(),
	}
	if err := database.DB.Create(&interaction).Error; err != nil {
		return err
	}

	// Mettre à jour les statistiques de l'organisateur
	UpdateOrganisateurStats(stand.Kermesse.Organisateurs, quantity)

	return nil
}

// UpdateStandStats met à jour ou crée les statistiques du stand
func UpdateStandStats(standID uint, tokensUsed, itemsSold int, revenue float64) error {
	var stats models.StandStats
	err := database.DB.Where("stand_id = ?", standID).First(&stats).Error
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		return err
	}

	// Si les stats n'existent pas encore, les créer
	if errors.Is(err, gorm.ErrRecordNotFound) {
		stats = models.StandStats{
			StandID:         standID,
			TotalTokensUsed: tokensUsed,
			ItemsSold:       itemsSold,
			Revenue:         revenue,
			CreatedAt:       time.Now(),
			UpdatedAt:       time.Now(),
		}
		return database.DB.Create(&stats).Error
	}

	// Sinon, les mettre à jour
	stats.TotalTokensUsed += tokensUsed
	stats.ItemsSold += itemsSold
	stats.Revenue += revenue
	stats.UpdatedAt = time.Now()

	return database.DB.Save(&stats).Error
}

// ValidateKermesseAndStand vérifie si un stand appartient à une kermesse et si l'utilisateur est bien inscrit à la kermesse
func ValidateKermesseAndStand(kermesseID, standID, userID uint) error {
	// Vérifier si le stand appartient à la kermesse
	var stand models.Stand
	if err := database.DB.Where("id = ? AND kermesse_id = ?", standID, kermesseID).First(&stand).Error; err != nil {
		return errors.New("Le stand ne fait pas partie de cette kermesse")
	}

	// Vérifier si l'utilisateur est inscrit à la kermesse
	var participant models.Kermesse
	if err := database.DB.Where("id = ? AND EXISTS (SELECT 1 FROM kermesse_participants WHERE kermesse_id = ? AND user_id = ?)", kermesseID, kermesseID, userID).First(&participant).Error; err != nil {
		return errors.New("Vous n'êtes pas inscrit à cette kermesse")
	}

	return nil
}

// AddOrUpdatePlayerScore ajoute ou met à jour le score d'un joueur pour un stand spécifique dans une kermesse
func AddOrUpdatePlayerScore(kermesseID, standID, userID uint, score int) error {
	// Vérifier si le stand fait partie de la kermesse et si l'utilisateur y est inscrit
	if err := ValidateKermesseAndStand(kermesseID, standID, userID); err != nil {
		return err
	}

	var playerScore models.PlayerScore

	// Vérifier si un score existe déjà pour cet utilisateur et ce stand
	err := database.DB.Where("user_id = ? AND stand_id = ?", userID, standID).First(&playerScore).Error
	if err != nil {
		// Si le score n'existe pas encore, on le crée
		playerScore = models.PlayerScore{
			UserID:    userID,
			StandID:   standID,
			Score:     score,
			CreatedAt: time.Now(),
		}
		return database.DB.Create(&playerScore).Error
	}

	// Si le score existe, le mettre à jour
	playerScore.Score = score
	playerScore.CreatedAt = time.Now()
	return database.DB.Save(&playerScore).Error
}

// RemovePlayerScore supprime un score existant pour un joueur dans un stand spécifique d'une kermesse
func RemovePlayerScore(kermesseID, standID, userID uint) error {
	// Vérifier si le stand fait partie de la kermesse et si l'utilisateur y est inscrit
	if err := ValidateKermesseAndStand(kermesseID, standID, userID); err != nil {
		return err
	}

	var playerScore models.PlayerScore
	if err := database.DB.Where("user_id = ? AND stand_id = ?", userID, standID).First(&playerScore).Error; err != nil {
		return errors.New("Score not found")
	}
	return database.DB.Delete(&playerScore).Error
}

// DoesStandExist vérifie si un stand existe dans la base de données
func DoesStandExist(standID uint) bool {
	var stand models.Stand
	err := database.DB.First(&stand, standID).Error
	return err == nil
}
