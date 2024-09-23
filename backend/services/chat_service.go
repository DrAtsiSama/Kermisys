package services

import (
	"sync"

	"github.com/gorilla/websocket"
)

var clients = make(map[*websocket.Conn]bool)
var broadcast = make(chan Message)
var upgrader = websocket.Upgrader{}
var chatMu sync.Mutex

type Message struct {
	Username string `json:"username"`
	Content  string `json:"content"`
}

// HandleConnections upgrades HTTP requests to WebSocket connections
func HandleConnections(conn *websocket.Conn) {
	defer func() {
		chatMu.Lock()
		delete(clients, conn)
		chatMu.Unlock()
		conn.Close()
	}()

	clients[conn] = true

	for {
		var msg Message
		err := conn.ReadJSON(&msg)
		if err != nil {
			break
		}
		broadcast <- msg
	}
}

// HandleMessages handles incoming messages and broadcasts them
func HandleMessages() {
	for {
		msg := <-broadcast
		chatMu.Lock()
		for client := range clients {
			err := client.WriteJSON(msg)
			if err != nil {
				client.Close()
				delete(clients, client)
			}
		}
		chatMu.Unlock()
	}
}
