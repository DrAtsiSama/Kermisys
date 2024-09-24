package controllers

import (
	"net/http"

	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Récupérer les statistiques
// @Description  Renvoie les statistiques actuelles du système
// @Tags         Statistiques
// @Produce      json
// @Success      200  {object}  map[string]interface{} "Statistiques actuelles"
// @Router       /statistics [get]
func GetStatisticsHandler(c *gin.Context) {
	stats := services.GetStatistics()
	c.JSON(http.StatusOK, stats)
}
