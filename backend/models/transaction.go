package models

import "time"

type Transaction struct {
	ID        uint      `gorm:"primaryKey"`
	StandID   uint      `gorm:"not null"` // Référence vers le stand
	UserID    uint      `gorm:"not null"` // Référence vers l'utilisateur
	Amount    int       `gorm:"not null"` // Nombre de jetons utilisés
	Timestamp time.Time `gorm:"not null"`

	// Associations
	Stand Stand `gorm:"foreignKey:StandID;constraint:OnDelete:CASCADE"`
	User  User  `gorm:"foreignKey:UserID;constraint:OnDelete:CASCADE"`
}
