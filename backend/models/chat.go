package models

import (
	"fmt"
	"sync"

	"github.com/gorilla/websocket"
)

// Client représente un utilisateur connecté
type Client struct {
	ID   string          // Identifiant unique de l'utilisateur (e.g., username)
	Conn *websocket.Conn // Connexion WebSocket
	Send chan Message    // Canal pour envoyer des messages
}

// Message représente un message de chat
type Message struct {
	SenderID   string `json:"sender_id"`   // ID de l'expéditeur
	ReceiverID string `json:"receiver_id"` // ID du destinataire
	Content    string `json:"content"`     // Contenu du message
}

// Hub représente le gestionnaire de connexions WebSocket
type Hub struct {
	clients    map[string]*Client // Liste des clients connectés
	register   chan *Client       // Canal pour enregistrer les nouvelles connexions
	unregister chan *Client       // Canal pour supprimer les connexions
	broadcast  chan Message       // Canal pour diffuser les messages
	mu         sync.Mutex         // Mutex pour protéger l'accès aux clients
}

var hub *Hub

// NewHub initialise un nouveau Hub
func NewHub() *Hub {
	return &Hub{
		clients:    make(map[string]*Client),
		register:   make(chan *Client),
		unregister: make(chan *Client),
		broadcast:  make(chan Message),
	}
}

// Run démarre le hub pour gérer les connexions et messages
func (h *Hub) Run() {
	for {
		select {
		case client := <-h.register:
			h.mu.Lock()
			h.clients[client.ID] = client
			h.mu.Unlock()
			fmt.Printf("Utilisateur %s connecté\n", client.ID)

		case client := <-h.unregister:
			h.mu.Lock()
			if _, ok := h.clients[client.ID]; ok {
				close(client.Send)
				delete(h.clients, client.ID)
				fmt.Printf("Utilisateur %s déconnecté\n", client.ID)
			}
			h.mu.Unlock()

		case message := <-h.broadcast:
			h.mu.Lock()
			if recipient, ok := h.clients[message.ReceiverID]; ok {
				recipient.Send <- message
			}
			h.mu.Unlock()
		}
	}
}

// GetHub retourne l'instance du Hub
func GetHub() *Hub {
	if hub == nil {
		hub = NewHub()
		go hub.Run()
	}
	return hub
}
