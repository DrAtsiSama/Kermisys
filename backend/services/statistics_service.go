package services

import (
	"sync"
)

var statsMu sync.Mutex
var statistics = make(map[string]int)

// UpdateStatistics updates statistics based on an event
func UpdateStatistics(event string, value int) {
	statsMu.Lock()
	statistics[event] += value
	statsMu.Unlock()
}

// GetStatistics returns the current statistics
func GetStatistics() map[string]int {
	statsMu.Lock()
	defer statsMu.Unlock()
	return statistics
}
