package models

type TombolaLot struct {
	ID          uint   `gorm:"primaryKey"`
	KermesseID  uint   `gorm:"not null"` // Référence vers la kermesse
	Description string `gorm:"type:text;not null"`
	Quantity    int    `gorm:"not null"` // Nombre de lots disponibles

	// Associations
	Kermesse Kermesse `gorm:"foreignKey:KermesseID;constraint:OnDelete:CASCADE"`
}
