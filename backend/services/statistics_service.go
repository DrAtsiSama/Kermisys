package services

import (
	"errors"
	"sync"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"gorm.io/gorm"
)

var statsMu sync.Mutex
var statistics = make(map[string]int)

// UpdateStatistics updates statistics based on an event
func UpdateStatistics(event string, value int) {
	statsMu.Lock()
	statistics[event] += value
	statsMu.Unlock()
}

// GetStatistics returns the current statistics
func GetStatistics() map[string]int {
	statsMu.Lock()
	defer statsMu.Unlock()
	return statistics
}

// UpdateKermesseStats met à jour ou crée les statistiques de la kermesse
func UpdateKermesseStats(kermesseID uint, participants, tokensUsed int, revenue float64) error {
	var stats models.KermesseStats
	err := database.DB.Where("kermesse_id = ?", kermesseID).First(&stats).Error
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		return err
	}

	// Si les stats n'existent pas encore, les créer
	if errors.Is(err, gorm.ErrRecordNotFound) {
		stats = models.KermesseStats{
			KermesseID:        kermesseID,
			TotalParticipants: participants,
			TotalTokensUsed:   tokensUsed,
			TotalRevenue:      revenue,
			CreatedAt:         time.Now(),
			UpdatedAt:         time.Now(),
		}
		return database.DB.Create(&stats).Error
	}

	// Sinon, les mettre à jour
	stats.TotalParticipants += participants
	stats.TotalTokensUsed += tokensUsed
	stats.TotalRevenue += revenue
	stats.UpdatedAt = time.Now()

	return database.DB.Save(&stats).Error
}

// UpdateOrganisateurStats met à jour les statistiques de l'organisateur
func UpdateOrganisateurStats(organisateurs []models.User, tokensUsed int) error {
	for _, organisateur := range organisateurs {
		var stats models.OrganisateurStats
		err := database.DB.Where("organisateur_id = ?", organisateur.ID).First(&stats).Error
		if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
			return err
		}

		// Si les stats n'existent pas encore, les créer
		if errors.Is(err, gorm.ErrRecordNotFound) {
			stats = models.OrganisateurStats{
				OrganisateurID: organisateur.ID,
				TotalKermesses: 1,
				TotalRevenue:   float64(tokensUsed) / 10, // Conversion des tokens en euros
				CreatedAt:      time.Now(),
				UpdatedAt:      time.Now(),
			}
			err = database.DB.Create(&stats).Error
			if err != nil {
				return err
			}
		} else {
			stats.TotalRevenue += float64(tokensUsed) / 10
			stats.TotalKermesses += 1
			stats.UpdatedAt = time.Now()
			err = database.DB.Save(&stats).Error
			if err != nil {
				return err
			}
		}
	}

	return nil
}
