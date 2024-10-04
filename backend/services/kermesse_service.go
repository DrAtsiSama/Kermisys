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
