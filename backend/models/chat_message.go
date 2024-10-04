// models/chat_message.go
package models

import "time"

type ChatMessage struct {
	ID         uint      `json:"id" gorm:"primary_key"`
	SenderID   string    `json:"sender_id"`
	ReceiverID string    `json:"receiver_id"`
	Content    string    `json:"content"`
	Timestamp  time.Time `json:"timestamp"`
}
