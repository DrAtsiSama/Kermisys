package services

import (
	"github.com/stripe/stripe-go"
	"github.com/stripe/stripe-go/charge"
)

func InitStripe(apiKey string) {
	stripe.Key = apiKey
}

// ProcessPayment processes a payment using Stripe
func ProcessPayment(amount int64, currency, description, source string) (string, error) {
	params := &stripe.ChargeParams{
		Amount:      stripe.Int64(amount),
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
