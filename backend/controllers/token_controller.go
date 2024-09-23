package controllers

import (
	"net/http"
	"strconv"

	"github.com/dratsisama/Kermisys/backend/services"

	"github.com/gin-gonic/gin"
)

func BuyTokens(c *gin.Context) {
	username := c.GetString("username")
	amount, err := strconv.Atoi(c.PostForm("amount"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid token amount"})
		return
	}
	err = services.BuyTokens(username, amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Tokens bought successfully"})
}

func DistributeTokens(c *gin.Context) {
	parent := c.GetString("username")
	child := c.PostForm("child")
	amount, err := strconv.Atoi(c.PostForm("amount"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid token amount"})
		return
	}
	err = services.DistributeTokens(parent, child, amount)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Tokens distributed successfully"})
}
