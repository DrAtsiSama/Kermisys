package models

type ParentChild struct {
	ParentID uint `gorm:"not null"` // Référence vers l'ID du parent
	ChildID  uint `gorm:"not null"` // Référence vers l'ID de l'enfant

	// Associations
	Parent User `gorm:"foreignKey:ParentID;constraint:OnDelete:CASCADE"`
	Child  User `gorm:"foreignKey:ChildID;constraint:OnDelete:CASCADE"`
}
