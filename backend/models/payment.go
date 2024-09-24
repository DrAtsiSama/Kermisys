package models

// PaymentRequest représente les données nécessaires pour traiter un paiement
type PaymentRequest struct {
	Amount      int64  `json:"amount"`      // Montant à payer en centimes
	Currency    string `json:"currency"`    // Devise (ex: 'EUR')
	Description string `json:"description"` // Description du paiement
	Source      string `json:"source"`      // Source de paiement (ex: un token de carte)
}

// PaymentResponse représente la réponse réussie d'un paiement
type PaymentResponse struct {
	ChargeID string `json:"chargeID"` // L'identifiant du paiement
}
