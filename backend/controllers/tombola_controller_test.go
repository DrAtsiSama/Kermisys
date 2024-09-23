package controllers

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func TestBuyTombolaTicket(t *testing.T) {
	router := gin.Default()
	router.POST("/buy-ticket", BuyTombolaTicket)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/buy-ticket", nil)
	req.Header.Set("username", "testuser")

	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
}

func TestDrawTombola(t *testing.T) {
	router := gin.Default()
	router.POST("/draw-tombola", DrawTombola)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/draw-tombola", nil)

	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
}
