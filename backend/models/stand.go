package models

import (
	"time"

	"gorm.io/gorm"
)

type Stand struct {
	ID          uint   `gorm:"primaryKey"`
	Name        string `gorm:"size:255;not null"`
	Type        string `gorm:"size:20;not null"`
	Description string `json:"description"`
	Stock       int    `gorm:"default:0"`
	KermesseID  uint   `gorm:"not null"` // Référence vers la Kermesse
	OwnerID     uint   `gorm:"not null"` // Référence vers le User qui tient le stand
	CreatedAt   time.Time
	UpdatedAt   time.Time
	DeletedAt   gorm.DeletedAt `gorm:"index" json:"-"`

	// Associations
	Kermesse Kermesse `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE"`
	Owner    User     `gorm:"foreignKey:OwnerID"`
}
