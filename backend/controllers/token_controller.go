package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/models" // Import des modèles
	"github.com/dratsisama/Kermisys/backend/services"
	"github.com/gin-gonic/gin"
)

// @Summary      Achat de jetons
// @Description  Permet à un utilisateur d'acheter des jetons
// @Tags         Jetons
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  header    string  true  "Nom d'utilisateur"
// @Param        amount    formData  int     true  "Nombre de jetons à acheter"
// @Success      200  {object}  models.BuyTokensResponse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /tokens/buy [post]
func AchatJetons(c *gin.Context) {
	var achatRequest struct {
		Amount int `json:"amount"`
	}
	userID, _ := strconv.Atoi(c.Param("user_id"))

	if err := c.ShouldBindJSON(&achatRequest); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid data"})
		return
	}

	err := services.AchatJetons(uint(userID), achatRequest.Amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Jetons achetés avec succès"})
}

// @Summary      Distribution de jetons
// @Description  Permet à un parent de distribuer des jetons à son enfant
// @Tags         Jetons
// @Accept       x-www-form-urlencoded
// @Produce      json
// @Param        username  header    string  true  "Nom d'utilisateur du parent"
// @Param        child     formData  string  true  "Nom d'utilisateur de l'enfant"
// @Param        amount    formData  int     true  "Nombre de jetons à distribuer"
// @Success      200  {object}  models.DistributeTokensResponse
// @Failure      400  {object}  models.ErrorResponse
// @Failure      500  {object}  models.ErrorResponse
// @Router       /tokens/distribute [post]
func DistributeTokens(c *gin.Context) {
	parent := c.GetString("username")
	child := c.PostForm("child")
	amount, err := strconv.Atoi(c.PostForm("amount"))
	if err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid token amount"})
		return
	}
	err = services.DistributeTokens(parent, child, amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, models.DistributeTokensResponse{Message: "Tokens distributed successfully"})
}
