package controllers

import (
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

// Initialize WebSocket upgrader to handle WebSocket connections
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool { return true },
}

// @Summary      WebSocket Chat Privé
// @Description  Établit une connexion WebSocket pour la discussion privée en temps réel entre un organisateur et un gérant de stand
// @Tags         WebSocket
// @Param        userID    query     string  true  "Identifiant de l'utilisateur (ex : username)"
// @Success      101  {string}  string  "Switching Protocols" - WebSocket handshake success
// @Failure      400  {object}  models.ErrorResponse
// @Failure      401  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /ws/private [get]
func ChatHandler(c *gin.Context) {
	// Récupérer l'en-tête Authorization
	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		c.AbortWithStatusJSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Authorization header required"})
		return
	}

	// Extraire le token JWT
	token := strings.TrimPrefix(authHeader, "Bearer ")
	claims, err := services.ValidateJWT(token)
	if err != nil {
		c.AbortWithStatusJSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Invalid token"})
		return
	}

	// Récupérer l'ID de l'utilisateur et son rôle à partir du token
	username := claims["username"].(string)

	// Utiliser fmt.Sprintf pour convertir userID en string, avec vérification de nil
	rawUserID, ok := claims["userID"]
	if !ok || rawUserID == nil {
		log.Println("Erreur : userID n'est pas présent dans le token JWT")
		c.AbortWithStatusJSON(http.StatusUnauthorized, models.ErrorResponse{Error: "UserID missing in token"})
		return
	}

	userID := fmt.Sprintf("%v", rawUserID) // Convertir userID en string
	userRole := claims["role"].(string)

	// Vérifier si l'utilisateur est autorisé
	if userRole != "admin" && userRole != "stand_manager" {
		c.AbortWithStatusJSON(http.StatusUnauthorized, models.ErrorResponse{Error: "Unauthorized: Access restricted to admins and stand managers"})
		return
	}

	// Mettre à niveau la connexion HTTP vers une connexion WebSocket
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		log.Printf("Erreur lors de la mise à niveau vers WebSocket : %v", err)
		return
	}
	defer func() {
		log.Printf("Déconnexion de l'utilisateur : %s", username)
		conn.Close()
	}()

	// Enregistrer le client dans le service
	services.RegisterClient(userID, conn)
	defer services.UnregisterClient(userID)

	// Boucle principale pour gérer les messages
	for {
		var msg services.Message
		if err := conn.ReadJSON(&msg); err != nil {
			log.Printf("Erreur de lecture du message WebSocket : %v", err)
			break
		}

		// Vérifier que `msg.SenderID` correspond à `userID` connecté à la session WebSocket
		if msg.SenderID != userID {
			log.Printf("Tentative de message non autorisé de %s alors que l'utilisateur connecté est %s", msg.SenderID, userID)
			errMsg := struct {
				Error string `json:"error"`
			}{
				Error: "Unauthorized sender",
			}
			if err := conn.WriteJSON(errMsg); err != nil {
				log.Printf("Erreur lors de l'envoi du message d'erreur WebSocket : %v", err)
				break
			}
			continue
		}

		// Envoyer le message à l'utilisateur destinataire
		services.SendPrivateMessage(msg)
		log.Printf("Message envoyé de %s à %s : %s", msg.SenderID, msg.ReceiverID, msg.Content)
	}
}
