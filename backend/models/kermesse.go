package models

import "time"

type Kermesse struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	Name          string    `gorm:"size:255;not null" json:"name"`
	Description   string    `json:"description"`
	Location      string    `json:"location"`
	StartDate     time.Time `json:"start_date"`
	EndDate       time.Time `json:"end_date"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
	Organisateurs []User    `gorm:"many2many:kermesse_organisateurs;constraint:OnDelete:CASCADE;" json:"organisateurs"` // Relation many-to-many avec les organisateurs
	Participants  []User    `gorm:"many2many:kermesse_participants;constraint:OnDelete:CASCADE;" json:"participants"`   // Relation many-to-many avec les participants
	Stands        []Stand   `gorm:"constraint:OnDelete:CASCADE;" json:"stands"`                                         // Association one-to-many avec les stands
}
