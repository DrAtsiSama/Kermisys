package services

import (
	"log"
	"sync"

	"github.com/gorilla/websocket"
)

type Message struct {
	SenderID   string `json:"sender_id"`
	ReceiverID string `json:"receiver_id"`
	Content    string `json:"content"`
}

var clients = make(map[string]*websocket.Conn)
var broadcast = make(chan Message)
var chatMu sync.Mutex

// RegisterClient enregistre un client avec son ID
func RegisterClient(userID string, conn *websocket.Conn) {
	chatMu.Lock()
	defer chatMu.Unlock()
	clients[userID] = conn
	log.Printf("Utilisateur %s enregistré", userID)
}

// UnregisterClient supprime un client de la liste
func UnregisterClient(userID string) {
	chatMu.Lock()
	defer chatMu.Unlock()
	if conn, ok := clients[userID]; ok {
		conn.Close()
		delete(clients, userID)
	}
}

// SendPrivateMessage envoie un message au destinataire spécifique
func SendPrivateMessage(msg Message) {
	chatMu.Lock()
	defer chatMu.Unlock()

	// Vérifier si le destinataire est connecté
	if conn, ok := clients[msg.ReceiverID]; ok {
		if err := conn.WriteJSON(msg); err != nil {
			conn.Close()
			delete(clients, msg.ReceiverID)
		}
	} else {
		// Si le destinataire n'est pas trouvé
		log.Printf("Destinataire %s non trouvé ou non connecté", msg.ReceiverID)
	}

}
