package controllers

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

// TestLogin vérifie que la fonction Login fonctionne correctement
func TestLogin(t *testing.T) {
	// Initialiser Gin
	router := gin.Default()
	router.POST("/login", Login)

	// Créer une requête HTTP POST
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/login", strings.NewReader("username=test"))
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")

	// Traiter la requête avec Gin
	router.ServeHTTP(w, req)

	// Vérifier que la réponse HTTP est 200 OK
	assert.Equal(t, http.StatusOK, w.Code)
}
