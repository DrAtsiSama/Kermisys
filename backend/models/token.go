package models

import "time"

type Token struct {
	ID          uint      `gorm:"primaryKey"`
	UserID      uint      `gorm:"not null"` // Référence vers l'utilisateur
	Amount      int       `gorm:"not null"`
	PurchasedAt time.Time `gorm:"not null"`

	// Associations
	User User `gorm:"foreignKey:UserID;constraint:OnDelete:CASCADE"`
}
