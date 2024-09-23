package services

import (
	"math/rand"
)

var tickets = make(map[string]int)
var participants = make([]string, 0)

func BuyTombolaTicket(username string, amount int) {
	tickets[username] += amount
	for i := 0; i < amount; i++ {
		participants = append(participants, username)
	}
}

func DrawTombola() string {
	if len(participants) == 0 {
		return "No participants"
	}
	winner := participants[rand.Intn(len(participants))]
	return winner
}
