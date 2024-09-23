package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

// Initialize WebSocket upgrader if you want to use it here
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool { return true },
}

// ChatHandler handles WebSocket chat connections using gin.Context
func ChatHandler(c *gin.Context) {
	// Use either the local upgrader or the services.Upgrader
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil) // Using the local upgrader
	// Or, if you want to use the upgrader from services, replace it with:
	// conn, err := services.Upgrader.Upgrade(c.Writer, c.Request, nil)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Could not upgrade to websocket"})
		return
	}
	defer conn.Close()

	for {
		var msg string
		err := conn.ReadJSON(&msg)
		if err != nil {
			break
		}
		// Echo the message back to the client
		if err := conn.WriteJSON(msg); err != nil {
			break
		}
	}
}
