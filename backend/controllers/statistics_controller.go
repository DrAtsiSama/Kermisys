package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/database"
	"github.com/dratsisama/Kermisys/backend/models"
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Obtenir les statistiques de la kermesse
// @Description  Récupère les statistiques de la kermesse par ID
// @Tags         Statistiques
// @Produce      json
// @Param        id   path      int  true  "ID de la kermesse"
// @Success      200  {object}  models.KermesseStats
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stats/kermesse/{id} [get]
func GetKermesseStats(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	var stats models.KermesseStats
	if err := database.DB.Where("kermesse_id = ?", id).First(&stats).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Kermesse non trouvée"})
		return
	}

	c.JSON(http.StatusOK, stats)
}

// @Summary      Obtenir les statistiques d'un stand
// @Description  Récupère les statistiques d'un stand par ID
// @Tags         Statistiques
// @Produce      json
// @Param        id   path      int  true  "ID du stand"
// @Success      200  {object}  models.StandStats
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stats/stand/{id} [get]
func GetStandStats(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	var stats models.StandStats
	if err := database.DB.Where("stand_id = ?", id).First(&stats).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Stand non trouvé"})
		return
	}

	c.JSON(http.StatusOK, stats)
}

// @Summary      Obtenir les statistiques de l'organisateur
// @Description  Récupère les statistiques de l'organisateur par ID
// @Tags         Statistiques
// @Produce      json
// @Param        id   path      int  true  "ID de l'organisateur"
// @Success      200  {object}  models.OrganisateurStats
// @Failure      404  {object}  models.ErrorResponse
// @Router       /stats/organisateur/{id} [get]
func GetOrganisateurStats(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	var stats models.OrganisateurStats
	if err := database.DB.Where("organisateur_id = ?", id).First(&stats).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Organisateur non trouvé"})
		return
	}

	c.JSON(http.StatusOK, stats)
}

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
