package models

import "time"

type Transaction struct {
	ID            uint      `gorm:"primaryKey"`
	StandID       uint      `gorm:"not null"` // Référence vers le stand
	UserID        uint      `gorm:"not null"` // Référence vers l'utilisateur
	KermesseID    uint      `gorm:"not null"`
	Currency      string    `gorm:"size:10;not null"`
	Status        string    `gorm:"size:50;not null"`
	PaymentIntent string    `gorm:"size:255"`
	Amount        int64     `gorm:"not null"` // Nombre de jetons utilisés
	Timestamp     time.Time `gorm:"not null"`

	// Associations
	Stand Stand `gorm:"foreignKey:StandID;constraint:OnDelete:CASCADE"`
	User  User  `gorm:"foreignKey:UserID;constraint:OnDelete:CASCADE"`
}
