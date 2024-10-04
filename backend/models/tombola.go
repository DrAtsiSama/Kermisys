package models

type Tombola struct {
	ID      uint     `json:"id"`
	Name    string   `json:"name"`
	Lots    []Lot    `json:"lots"` // Lots à gagner
	Tickets []Ticket `json:"tickets"`
}

type Lot struct {
	ID        uint   `json:"id"`
	Name      string `json:"name"`
	Quantity  int    `json:"quantity"`
	TombolaID uint   `json:"tombola_id"`
}

type Ticket struct {
	ID        uint `json:"id"`
	Number    int  `json:"number"`
	UserID    uint `json:"user_id"`
	TombolaID uint `json:"tombola_id"`
}
