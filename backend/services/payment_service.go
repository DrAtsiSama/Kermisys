package services

import (
	"os"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/stripe/stripe-go"
	"github.com/stripe/stripe-go/charge"
	"github.com/stripe/stripe-go/paymentintent"
)

func InitStripe() {
	stripe.Key = os.Getenv("STRIPE_SECRET_KEY")
}

// ProcessPayment processes a payment using Stripe
func ProcessPayment(amount int64, currency, description, source string) (string, error) {
	params := &stripe.ChargeParams{
		Amount:      stripe.Int64(amount), // Montant en centimes
		Currency:    stripe.String(currency),
		Description: stripe.String(description),
	}
	params.SetSource(source)

	ch, err := charge.New(params)
	if err != nil {
		return "", err
	}
	return ch.ID, nil
}

// CreatePaymentIntent crée un PaymentIntent Stripe et sauvegarde la transaction
func CreatePaymentIntent(userID, kermesseID uint, amount int64, currency string) (*stripe.PaymentIntent, error) {
	params := &stripe.PaymentIntentParams{
		Amount:   stripe.Int64(amount),
		Currency: stripe.String(currency),
	}
	intent, err := paymentintent.New(params)
	if err != nil {
		return nil, err
	}

	transaction := models.Transaction{
		UserID:        userID,
		KermesseID:    kermesseID,
		Amount:        amount,
		Currency:      currency,
		Status:        "pending",
		PaymentIntent: intent.ID,
	}

	if err := database.DB.Create(&transaction).Error; err != nil {
		return nil, err
	}

	return intent, nil
}

// UpdateTransactionStatus met à jour le statut de la transaction
func UpdateTransactionStatus(paymentIntentID, status string) error {
	return database.DB.Model(&models.Transaction{}).
		Where("payment_intent = ?", paymentIntentID).
		Update("status", status).Error
}
