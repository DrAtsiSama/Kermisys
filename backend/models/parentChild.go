package models

import "time"

type ParentChild struct {
	ParentID uint `gorm:"not null"` // Référence vers l'ID du parent
	ChildID  uint `gorm:"not null"` // Référence vers l'ID de l'enfant

	// Associations
	Parent User `gorm:"foreignKey:ParentID;constraint:OnDelete:CASCADE"`
	Child  User `gorm:"foreignKey:ChildID;constraint:OnDelete:CASCADE"`
}

type ParentChildRequest struct {
	ID        uint      `gorm:"primaryKey"`
	ParentID  uint      `json:"parent_id"`
	ChildID   uint      `json:"child_id"`
	Status    string    `json:"status"` // pending, accepted, rejected
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	// Associations
	Parent User `gorm:"foreignKey:ParentID;constraint:OnDelete:CASCADE"`
	Child  User `gorm:"foreignKey:ChildID;constraint:OnDelete:CASCADE"`
}
