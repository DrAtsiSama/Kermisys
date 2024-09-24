package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

// Initialize WebSocket upgrader to handle WebSocket connections
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool { return true },
}

// @Summary      WebSocket Chat
// @Description  Établit une connexion WebSocket pour la fonctionnalité de chat en temps réel
// @Tags         WebSocket
// @Success      101  {string}  string  "Switching Protocols" - WebSocket handshake success
// @Failure      500  {object}  models.ErrorResponse
// @Router       /ws/chat [get]
func ChatHandler(c *gin.Context) {
	// Mettre à niveau la connexion HTTP vers une connexion WebSocket
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil) // Utilisation de l'upgrader local

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
		// Renvoyer le message reçu au client
		if err := conn.WriteJSON(msg); err != nil {
			break
		}
	}
}
