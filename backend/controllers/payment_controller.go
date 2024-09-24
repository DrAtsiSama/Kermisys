package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/models" // Import du modèle PaymentRequest et PaymentResponse
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Processus de paiement
// @Description  Traite une demande de paiement en fonction des détails fournis
// @Tags         Paiement
// @Accept       json
// @Produce      json
// @Param        paymentData  body  models.PaymentRequest  true  "Données de paiement"
// @Success      200  {object}  models.PaymentResponse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /payment [post]
func ProcessPayment(c *gin.Context) {
	var paymentData models.PaymentRequest

	if err := c.ShouldBindJSON(&paymentData); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
		return
	}

	chargeID, err := services.ProcessPayment(paymentData.Amount, paymentData.Currency, paymentData.Description, paymentData.Source)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, models.PaymentResponse{ChargeID: chargeID})
}
