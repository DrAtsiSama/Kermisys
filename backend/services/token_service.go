package services

import (
	"errors"
)

var userTokens = make(map[string]int)

func BuyTokens(username string, amount int) error {
	if amount <= 0 {
		return errors.New("invalid token amount")
	}
	userTokens[username] += amount
	return nil
}

func DistributeTokens(parent string, child string, amount int) error {
	if userTokens[parent] < amount {
		return errors.New("insufficient tokens")
	}
	userTokens[parent] -= amount
	userTokens[child] += amount
	return nil
}
