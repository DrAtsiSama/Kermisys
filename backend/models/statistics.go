package models

import "time"

type KermesseStats struct {
	ID                uint      `json:"id" gorm:"primaryKey"`
	KermesseID        uint      `json:"kermesse_id"`
	TotalParticipants int       `json:"total_participants"`
	TotalTokensUsed   int       `json:"total_tokens_used"`
	TotalRevenue      float64   `json:"total_revenue"`
	CreatedAt         time.Time `json:"created_at"`
	UpdatedAt         time.Time `json:"updated_at"`
}

type StandStats struct {
	ID              uint      `json:"id" gorm:"primaryKey"`
	StandID         uint      `json:"stand_id"`
	TotalTokensUsed int       `json:"total_tokens_used"`
	ItemsSold       int       `json:"items_sold"`
	Revenue         float64   `json:"revenue"`
	CreatedAt       time.Time `json:"created_at"`
	UpdatedAt       time.Time `json:"updated_at"`
}

type OrganisateurStats struct {
	ID             uint      `json:"id" gorm:"primaryKey"`
	OrganisateurID uint      `json:"organisateur_id"`
	TotalKermesses int       `json:"total_kermesses"`
	TotalRevenue   float64   `json:"total_revenue"`
	CreatedAt      time.Time `json:"created_at"`
	UpdatedAt      time.Time `json:"updated_at"`
}
