package controllers

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func TestInteractWithStand(t *testing.T) {
	router := gin.Default()
	router.POST("/interact-stand", InteractWithStand)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/interact-stand", strings.NewReader("stand=food"))
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("username", "testuser")

	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
}
