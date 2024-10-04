package models

import (
	"time"

	"gorm.io/gorm"
)

type Stand struct {
	ID          uint           `gorm:"primaryKey"`
	Name        string         `gorm:"size:255;not null" json:"name"`
	Type        string         `gorm:"size:20;not null" json:"type"` // e.g., "food", "game"
	Description string         `gorm:"size:500" json:"description"`  // Augmenté la taille pour plus de flexibilité
	Location    string         `gorm:"size:255" json:"location"`     // Lieu où se trouve le stand
	Stock       int            `gorm:"default:0" json:"stock"`
	StartDate   time.Time      `json:"start_date"`                  // Date de début du stand
	EndDate     time.Time      `json:"end_date"`                    // Date de fin du stand
	KermesseID  uint           `gorm:"not null" json:"kermesse_id"` // Référence vers la Kermesse
	OwnerID     uint           `gorm:"not null" json:"owner_id"`    // Référence vers le User qui tient le stand
	CreatedAt   time.Time      `json:"created_at"`                  // Date de création du stand
	UpdatedAt   time.Time      `json:"updated_at"`                  // Date de la dernière mise à jour du stand
	DeletedAt   gorm.DeletedAt `gorm:"index" json:"-"`              // Gestion de la suppression

	// Associations
	Kermesse Kermesse `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE" json:"kermesse"`
	Owner    User     `gorm:"foreignKey:OwnerID" json:"owner"`
}
