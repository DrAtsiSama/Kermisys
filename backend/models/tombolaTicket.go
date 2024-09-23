package models

import "time"

type TombolaTicket struct {
	ID          uint      `gorm:"primaryKey"`
	UserID      uint      `gorm:"not null"` // Référence vers l'utilisateur
	KermesseID  uint      `gorm:"not null"` // Référence vers la kermesse
	Amount      int       `gorm:"not null"` // Nombre de billets achetés
	PurchasedAt time.Time `gorm:"not null"`

	// Associations
	User     User     `gorm:"foreignKey:UserID;constraint:OnDelete:CASCADE"`
	Kermesse Kermesse `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE"`
}
