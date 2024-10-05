package services

import (
	"errors"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"

	"gorm.io/gorm"
)

type KermesseService struct {
	DB *gorm.DB
}

func CreateKermesse(kermesse models.Kermesse, userID uint) error {
	var user models.User
	if err := database.DB.First(&user, userID).Error; err != nil {
		return errors.New("Utilisateur non trouvé")
	}

	kermesse.Organisateurs = append(kermesse.Organisateurs, user)

	if err := database.DB.Create(&kermesse).Error; err != nil {
		return err
	}
	return nil
}

func (s *KermesseService) GetAllKermesses() ([]models.Kermesse, error) {
	var kermesses []models.Kermesse
	if err := s.DB.Find(&kermesses).Error; err != nil {
		return nil, err
	}
	return kermesses, nil
}

func (s *KermesseService) GetKermesseByID(id uint) (*models.Kermesse, error) {
	var kermesse models.Kermesse
	if err := s.DB.First(&kermesse, id).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, nil
		}
		return nil, err
	}
	return &kermesse, nil
}

func (s *KermesseService) UpdateKermesse(id uint, updatedKermesse *models.Kermesse) error {
	var kermesse models.Kermesse
	if err := s.DB.First(&kermesse, id).Error; err != nil {
		return err
	}
	if err := s.DB.Model(&kermesse).Updates(updatedKermesse).Error; err != nil {
		return err
	}
	return nil
}

func (s *KermesseService) DeleteKermesse(id uint) error {
	if err := s.DB.Delete(&models.Kermesse{}, id).Error; err != nil {
		return err
	}
	return nil
}

func AddParticipant(kermesseID, userID uint) error {
	var kermesse models.Kermesse
	if err := database.DB.Preload("Participants").First(&kermesse, kermesseID).Error; err != nil {
		return errors.New("Kermesse non trouvée")
	}

	var user models.User
	if err := database.DB.First(&user, userID).Error; err != nil {
		return errors.New("Utilisateur non trouvé")
	}

	kermesse.Participants = append(kermesse.Participants, user)
	if err := database.DB.Save(&kermesse).Error; err != nil {
		return err
	}
	return nil
}

func AddStand(kermesseID, standID uint) error {
	var kermesse models.Kermesse
	if err := database.DB.Preload("Stands").First(&kermesse, kermesseID).Error; err != nil {
		return errors.New("Kermesse non trouvée")
	}

	var stand models.Stand
	if err := database.DB.First(&stand, standID).Error; err != nil {
		return errors.New("Stand non trouvé")
	}

	kermesse.Stands = append(kermesse.Stands, stand)
	if err := database.DB.Save(&kermesse).Error; err != nil {
		return err
	}
	return nil
}

// JoinKermesse permet à un utilisateur de rejoindre une kermesse
func JoinKermesse(kermesseID, userID uint) error {
	var kermesse models.Kermesse
	if err := database.DB.Preload("Participants").First(&kermesse, kermesseID).Error; err != nil {
		return errors.New("Kermesse non trouvée")
	}

	// Vérifier si l'utilisateur est déjà inscrit
	for _, participant := range kermesse.Participants {
		if participant.ID == userID {
			return errors.New("Vous êtes déjà inscrit à cette kermesse")
		}
	}

	// Ajouter l'utilisateur à la kermesse
	var user models.User
	if err := database.DB.First(&user, userID).Error; err != nil {
		return errors.New("Utilisateur non trouvé")
	}

	kermesse.Participants = append(kermesse.Participants, user)

	// Mettre à jour les stats de la kermesse
	if err := UpdateKermesseStats(kermesseID, 1, 0, 0); err != nil {
		return err
	} // Incrémenter le nombre de participants

	// Enregistrer les modifications dans la base de données
	return database.DB.Save(&kermesse).Error
}

// LeaveKermesse permet à un utilisateur de quitter une kermesse
func LeaveKermesse(kermesseID, userID uint) error {
	var kermesse models.Kermesse
	if err := database.DB.Preload("Participants").First(&kermesse, kermesseID).Error; err != nil {
		return errors.New("Kermesse non trouvée")
	}

	// Vérifier si l'utilisateur est inscrit
	isParticipant := false
	for _, participant := range kermesse.Participants {
		if participant.ID == userID {
			isParticipant = true
			break
		}
	}

	if !isParticipant {
		return errors.New("Vous n'êtes pas inscrit à cette kermesse")
	}

	// Supprimer l'utilisateur de la liste des participants
	if err := database.DB.Model(&kermesse).Association("Participants").Delete(&models.User{ID: userID}); err != nil {
		return errors.New("Impossible de retirer l'utilisateur de la kermesse")
	}

	// Mettre à jour les stats de la kermesse uniquement si l'utilisateur était effectivement inscrit
	if err := UpdateKermesseStats(kermesseID, -1, 0, 0); err != nil {
		return err
	}

	return nil
}
