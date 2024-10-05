package models

import "time"

type Tombola struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	Name          string    `json:"name"`
	KermesseID    uint      `json:"kermesse_id"`
	Lots          []Lot     `gorm:"foreignKey:TombolaID" json:"lots"`                     // Relation avec les lots
	Tickets       []Ticket  `gorm:"foreignKey:TombolaID" json:"tickets"`                  // Relation avec les tickets
	Organisateurs []User    `gorm:"many2many:tombola_organisateurs" json:"organisateurs"` // Relation avec les organisateurs
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}

type Ticket struct {
	ID         uint `gorm:"primaryKey" json:"id"`
	UserID     uint `json:"user_id"`
	TombolaID  uint `json:"tombola_id"`
	KermesseID uint `json:"kermesse_id"`
	Winner     bool `json:"winner" gorm:"default:false"`
}

type Lot struct {
	ID          uint         `json:"id"`
	Name        string       `json:"name"`
	Quantity    int          `json:"quantity"`
	TombolaID   uint         `json:"tombola_id"`
	UserWonLots []UserWonLot `gorm:"foreignKey:LotID" json:"user_won_lots"`
}

type UserWonLot struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	UserID    uint      `json:"user_id"`
	LotID     uint      `json:"lot_id"`
	TombolaID uint      `json:"tombola_id"`
	WonAt     time.Time `json:"won_at"`
}
