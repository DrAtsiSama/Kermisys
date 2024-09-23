package models

import "time"

type Stand struct {
	ID         uint   `gorm:"primaryKey"`
	KermesseID uint   `gorm:"not null"` // Référence vers la Kermesse
	Type       string `gorm:"size:20;not null"`
	Name       string `gorm:"size:255;not null"`
	Stock      int    `gorm:"default:0"`
	OwnerID    uint   `gorm:"not null"` // Référence vers le User qui tient le stand
	CreatedAt  time.Time
	UpdatedAt  time.Time

	// Associations
	Kermesse Kermesse `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE"`
	Owner    User     `gorm:"foreignKey:OwnerID"`
}
