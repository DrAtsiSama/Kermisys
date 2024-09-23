package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// ProcessPayment processes a payment request
func ProcessPayment(c *gin.Context) {
	var paymentData struct {
		Amount      int64  `json:"amount"`
		Currency    string `json:"currency"`
		Description string `json:"description"`
		Source      string `json:"source"`
	}

	if err := c.ShouldBindJSON(&paymentData); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request data"})
		return
	}

	chargeID, err := services.ProcessPayment(paymentData.Amount, paymentData.Currency, paymentData.Description, paymentData.Source)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"chargeID": chargeID})
}
