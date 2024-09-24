package models

import (
	"time"

	"gorm.io/gorm"
)

type User struct {
	ID           uint   `gorm:"primaryKey"`
	Username     string `gorm:"size:100;not null"`
	PasswordHash string `gorm:"size:255;not null"`
	Email        string `gorm:"size:255;unique;not null"`
	Role         string `gorm:"size:20;not null"`
	CreatedAt    time.Time
	UpdatedAt    time.Time
	DeletedAt    gorm.DeletedAt `gorm:"index" swaggerignore:"true"`
}
