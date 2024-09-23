package services

import (
	"errors"
)

var standStock = make(map[string]int)

func InteractWithStand(username string, stand string, tokens int) error {
	if standStock[stand] <= 0 {
		return errors.New("insufficient stock")
	}
	standStock[stand] -= 1
	return nil
}
