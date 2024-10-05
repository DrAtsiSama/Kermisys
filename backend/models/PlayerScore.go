package models

import "time"

type PlayerScore struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	UserID    uint      `json:"user_id"`
	StandID   uint      `json:"stand_id"`
	Score     int       `json:"score"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

func (PlayerScore) TableName() string {
	return "player_scores"
}

// ScoreRequest représente la structure pour le score
type ScoreRequest struct {
	Score int `json:"score" binding:"required"`
}
