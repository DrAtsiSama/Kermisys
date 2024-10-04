package controllers

import (
	"net/http"
	"strconv"
	"time"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models" // Import du modèle PaymentRequest et PaymentResponse
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Processus de paiement
// @Description  Traite une demande de paiement en fonction des détails fournis
// @Tags         Paiements
// @Accept       json
// @Produce      json
// @Param        paymentData  body  models.PaymentRequest  true  "Données de paiement"
// @Success      201  {object}  models.Transaction
// @Failure      400  {object}  models.ErrorResponse
// @Router       /payments [post]
// @Security Bearer
func ProcessPayment(c *gin.Context) {
	// Récupérer l'utilisateur depuis le JWT
	user, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Utilisateur non authentifié"})
		return
	}

	// Assurer que l'utilisateur est du bon type
	authUser, ok := user.(models.User)
	if !ok {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Erreur d'authentification"})
		return
	}

	userID := authUser.ID

	var paymentData struct {
		KermesseID uint   `json:"kermesse_id"`
		StandID    uint   `json:"stand_id"`
		Amount     int64  `json:"amount"`
		Currency   string `json:"currency"`
	}
	if err := c.ShouldBindJSON(&paymentData); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid payment data"})
		return
	}

	// Valider que le stand existe dans la base de données
	var stand models.Stand
	if err := database.DB.First(&stand, paymentData.StandID).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Stand non trouvé"})
		return
	}

	// Valider que la kermesse existe dans la base de données
	var kermesse models.Kermesse
	if err := database.DB.First(&kermesse, paymentData.KermesseID).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Kermesse non trouvée"})
		return
	}

	// Crée un PaymentIntent Stripe
	intent, err := services.CreatePaymentIntent(userID, paymentData.KermesseID, paymentData.Amount, paymentData.Currency)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to create payment intent"})
		return
	}

	// Créer une transaction avec un stand valide
	transaction := models.Transaction{
		StandID:       stand.ID,
		UserID:        userID,
		KermesseID:    paymentData.KermesseID,
		Currency:      paymentData.Currency,
		Status:        "pending",
		PaymentIntent: intent.ID,
		Amount:        paymentData.Amount,
		Timestamp:     time.Now(),
	}

	// Enregistrer la transaction dans la base de données
	if err := database.DB.Create(&transaction).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to create transaction"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"payment_intent": intent.ID, "client_secret": intent.ClientSecret})
}

// // @Summary      Créer un paiement
// // @Description  Crée un PaymentIntent Stripe pour une kermesse
// // @Tags         Paiements
// // @Accept       json
// // @Produce      json
// // @Param        payment  body  models.Transaction  true  "Détails du paiement"
// // @Success      201  {object}  models.Transaction
// // @Failure      400  {object}  models.ErrorResponse
// // @Router       /payments [post]
// // @Security Bearer
// func CreatePayment(c *gin.Context) {
// 	var paymentData struct {
// 		UserID     uint   `json:"user_id"`
// 		KermesseID uint   `json:"kermesse_id"`
// 		Amount     int64  `json:"amount"`
// 		Currency   string `json:"currency"`
// 	}
// 	if err := c.ShouldBindJSON(&paymentData); err != nil {
// 		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid payment data"})
// 		return
// 	}

// 	intent, err := services.CreatePaymentIntent(paymentData.UserID, paymentData.KermesseID, paymentData.Amount, paymentData.Currency)
// 	if err != nil {
// 		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to create payment intent"})
// 		return
// 	}

// 	c.JSON(http.StatusCreated, gin.H{"payment_intent": intent.ID, "client_secret": intent.ClientSecret})
// }

// @Summary      Récupérer les transactions d'un utilisateur
// @Description  Récupère toutes les transactions liées à un utilisateur
// @Tags         Paiements
// @Produce      json
// @Param        userID  path  int  true  "ID de l'utilisateur"
// @Success      200  {array}  models.Transaction
// @Router       /payments/user/{userID} [get]
// @Security Bearer
func GetTransactionsByUserID(c *gin.Context) {
	userID, err := strconv.Atoi(c.Param("userID"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid userID"})
		return
	}

	var transactions []models.Transaction
	if err := database.DB.Where("user_id = ?", userID).Find(&transactions).Error; err != nil {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Transactions not found"})
		return
	}
	c.JSON(http.StatusOK, transactions)
}
