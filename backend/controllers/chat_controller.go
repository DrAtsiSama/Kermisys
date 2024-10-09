package controllers

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
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
// @Security Bearer
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

	rawUserID, ok := claims["userID"]
	if !ok || rawUserID == nil {
		log.Println("Erreur : userID n'est pas présent dans le token JWT")
		c.AbortWithStatusJSON(http.StatusUnauthorized, models.ErrorResponse{Error: "UserID missing in token"})
		return
	}

	userID := fmt.Sprintf("%v", rawUserID) // Convertir userID en string
	userRole := claims["role"].(string)

	log.Printf("Connexion WebSocket établie par l'utilisateur : %s (ID: %s, Rôle: %s)", username, userID, userRole)

	// Vérifier si l'utilisateur est autorisé
	if userRole != "admin" && userRole != "gerant_kermesse" {
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

		// Assigner l'ID de l'utilisateur connecté comme SenderID
		msg.SenderID = userID

		// Vérifier que le champ ReceiverID est présent
		if msg.ReceiverID == "" {
			log.Printf("Erreur : ReceiverID manquant pour le message de %s", msg.SenderID)
			errMsg := struct {
				Error string `json:"error"`
			}{
				Error: "ReceiverID is required",
			}
			if err := conn.WriteJSON(errMsg); err != nil {
				log.Printf("Erreur lors de l'envoi du message d'erreur WebSocket : %v", err)
				break
			}
			continue
		}

		// Afficher le message reçu dans la console pour vérification
		log.Printf("Message reçu de %s à %s : %s", msg.SenderID, msg.ReceiverID, msg.Content)

		// Sauvegarder le message dans la base de données
		chatMessage := models.ChatMessage{
			SenderID:   msg.SenderID,
			ReceiverID: msg.ReceiverID,
			Content:    msg.Content,
			Timestamp:  time.Now(),
		}
		if err := services.SaveChatMessage(chatMessage); err != nil {
			log.Printf("Erreur lors de la sauvegarde du message : %v", err)
			continue
		}

		// Envoyer le message à l'utilisateur destinataire
		services.SendPrivateMessage(msg)
		log.Printf("Message envoyé de %s à %s : %s", msg.SenderID, msg.ReceiverID, msg.Content)
	}
}

// @Summary      Récupérer l'historique des messages
// @Description  Récupère l'historique des messages entre deux utilisateurs, avec pagination
// @Tags         Chat
// @Produce      json
// @Param        sender_id   query     string  true  "ID de l'expéditeur"
// @Param        receiver_id query     string  true  "ID du destinataire"
// @Param        limit       query     int     false "Nombre de messages à récupérer" default(50)
// @Param        page        query     int     false "Numéro de page" default(1)
// @Success      200  {array}   models.ChatMessage
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /ws/history [get]
// @Security Bearer
func GetChatHistory(c *gin.Context) {
	senderID := c.Query("sender_id")
	receiverID := c.Query("receiver_id")
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "50"))
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	offset := (page - 1) * limit

	if senderID == "" || receiverID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Sender ID and Receiver ID are required"})
		return
	}

	var messages []models.ChatMessage
	if err := database.DB.Where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", senderID, receiverID, receiverID, senderID).
		Order("timestamp DESC").
		Offset(offset).
		Limit(limit).
		Find(&messages).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, messages)
}
