package models

import (
	"time"
)

// StandInteraction représente une interaction d'un utilisateur avec un stand
type StandInteraction struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	UserID    uint      `gorm:"not null" json:"user_id"`
	StandID   uint      `gorm:"not null" json:"stand_id"`
	Action    string    `gorm:"size:50;not null" json:"action"` // e.g., "play_game", "buy_item"
	Item      string    `gorm:"size:255" json:"item"`           // e.g., "Candy", "GameTicket" (pour l'achat)
	Quantity  int       `gorm:"default:1" json:"quantity"`
	Score     int       `json:"score"` // Utilisé si l'action est un jeu
	CreatedAt time.Time `json:"created_at"`
}

// TableName définit le nom de la table dans la base de données
func (StandInteraction) TableName() string {
	return "stand_interactions"
}
