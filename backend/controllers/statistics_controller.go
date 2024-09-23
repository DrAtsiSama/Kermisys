package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// GetStatisticsHandler returns the current statistics
func GetStatisticsHandler(c *gin.Context) {
	stats := services.GetStatistics()
	c.JSON(http.StatusOK, stats)
}
