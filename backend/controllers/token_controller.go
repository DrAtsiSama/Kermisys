package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/models" // Import des modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

type AchatRequest struct {
	Amount int `json:"amount"`
}

// @Summary      Achat de jetons
// @Description  Permet à un utilisateur d'acheter des jetons après un paiement réussi
// @Tags         Jetons
// @Accept       json
// @Produce      json
// @Param        user_id       path      int                  true  "ID de l'utilisateur"
// @Param        achatRequest  body      AchatRequest         true  "Nombre de jetons à acheter"
// @Success      200           {object}  models.BuyTokensResponse
// @Failure      400           {object}  models.ErrorResponse
// @Failure      500           {object}  models.ErrorResponse
// @Router       /parent/achat/{user_id} [post]
// @Security Bearer
func AchatJetons(c *gin.Context) {
	var achatRequest struct {
		Amount int `json:"amount"`
	}

	userID, _ := strconv.Atoi(c.Param("user_id"))

	if err := c.ShouldBindJSON(&achatRequest); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid data"})
		return
	}

	// Simuler un processus de paiement réussi
	description := "Achat de jetons"
	source := "tok_visa" // Remplacez par la source réelle pour Stripe
	paymentID, err := services.ProcessPayment(int64(achatRequest.Amount), "eur", description, source)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Échec du paiement: " + err.Error()})
		return
	}

	// Si le paiement est validé, ajouter les jetons à l'utilisateur
	err = services.AdjustTokenAmount(uint(userID), achatRequest.Amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Jetons achetés avec succès", "payment_id": paymentID})
}

type DistributeTokensRequest struct {
	Child  string `json:"child"`
	Amount int    `json:"amount"`
}

// @Summary      Distribution de jetons
// @Description  Permet à un parent de distribuer des jetons à son enfant
// @Tags         Jetons
// @Accept       json
// @Produce      json
// @Param        distributeTokensRequest  body      DistributeTokensRequest  true  "Détails de la distribution des jetons"
// @Success      200  {object}  models.DistributeTokensResponse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /parent/distribute-tokens [post]
// @Security Bearer
func DistributeTokens(c *gin.Context) {
	var distributeTokensRequest DistributeTokensRequest

	if err := c.ShouldBindJSON(&distributeTokensRequest); err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid data"})
		return
	}

	parent := c.GetString("username") // Récupérer le parent à partir du token JWT

	// Vérifier que l'enfant appartient bien au parent
	if !services.IsChildOfParent(parent, distributeTokensRequest.Child) {
		c.JSON(http.StatusUnauthorized, models.ErrorResponse{Error: "L'enfant n'appartient pas au parent"})
		return
	}

	// Distribuer les jetons
	err := services.DistributeTokens(parent, distributeTokensRequest.Child, distributeTokensRequest.Amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, models.DistributeTokensResponse{Message: "Tokens distributed successfully"})
}
