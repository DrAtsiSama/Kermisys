package controllers

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func TestBuyTokens(t *testing.T) {
	router := gin.Default()
	router.POST("/buy-tokens", BuyTokens)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/buy-tokens", strings.NewReader("amount=100"))
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("username", "testuser")

	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
}

func TestDistributeTokens(t *testing.T) {
	router := gin.Default()
	router.POST("/distribute-tokens", DistributeTokens)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/distribute-tokens", strings.NewReader("child=childuser&amount=50"))
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("username", "parentuser")

	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
}
