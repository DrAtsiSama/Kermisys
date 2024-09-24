package models

// TokenResponse représente la réponse réussie avec le token JWT
type TokenResponse struct {
	Token string `json:"token"`
}

// ErrorResponse représente une réponse d'erreur
type ErrorResponse struct {
	Error string `json:"error"`
}

// StandInteractionResponse représente la réponse pour une interaction réussie avec un stand
type StandInteractionResponse struct {
	Message string `json:"message"`
}

// BuyTokensResponse représente la réponse pour l'achat de jetons
type BuyTokensResponse struct {
	Message string `json:"message"`
}

// DistributeTokensResponse représente la réponse pour la distribution de jetons
type DistributeTokensResponse struct {
	Message string `json:"message"`
}

// BuyTombolaTicketResponse représente la réponse pour l'achat d'un billet de tombola
type BuyTombolaTicketResponse struct {
	Message string `json:"message"`
}

// DrawTombolaResponse représente la réponse du tirage de la tombola
type DrawTombolaResponse struct {
	Winner string `json:"winner"`
}

// UserResponse représente les détails d'un utilisateur
type UserResponse struct {
	ID       uint   `json:"id"`
	Username string `json:"username"`
	Email    string `json:"email"`
	Role     string `json:"role"`
}

// CreateUserResponse représente la réponse lorsque l'utilisateur est créé
type CreateUserResponse struct {
	Message string `json:"message"`
}

// LoginResponse représente la réponse réussie d'une connexion
type LoginResponse struct {
	Token string `json:"token"`
}

// MessageResponse représente les messages de réussite
type MessageResponse struct {
	Message string `json:"message"`
}
