package models

import "time"

type TombolaDraw struct {
	ID         uint      `gorm:"primaryKey"`
	KermesseID uint      `gorm:"not null"` // Référence vers la kermesse
	UserID     uint      `gorm:"not null"` // Référence vers le gagnant
	LotID      uint      `gorm:"not null"` // Référence vers le lot
	DrawDate   time.Time `gorm:"not null"`

	// Associations
	Kermesse Kermesse   `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE"`
	User     User       `gorm:"foreignKey:UserID;constraint:OnDelete:CASCADE"`
	Lot      TombolaLot `gorm:"foreignKey:LotID;constraint:OnDelete:CASCADE"`
}
