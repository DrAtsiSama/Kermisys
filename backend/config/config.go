package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/stripe/stripe-go"
)

type Config struct {
	DBHost     string
	DBUser     string
	DBPassword string
	DBName     string
	DBPort     string
	JWTSecret  string
}

var AppConfig Config

// LoadConfig charge les configurations depuis les variables d'environnement
func LoadConfig() {
	// Charge les variables d'environnement à partir d'un fichier .env si disponible
	err := godotenv.Load()
	if err != nil {
		log.Println("Pas de fichier .env trouvé, utilisation des variables d'environnement par défaut")
	}

	AppConfig = Config{
		DBHost:     getEnv("DB_HOST", os.Getenv("DB_HOST")),
		DBUser:     getEnv("DB_USER", os.Getenv("DB_USER")),
		DBPassword: getEnv("DB_PASSWORD", os.Getenv("DB_PASSWORD")),
		DBName:     getEnv("DB_NAME", os.Getenv("DB_NAME")),
		DBPort:     getEnv("DB_PORT", os.Getenv("DB_PORT")),
		JWTSecret:  getEnv("JWT_SECRET", os.Getenv("JWT_SECRET")),
	}
}

func InitStripe() {
	stripeKey := os.Getenv("STRIPE_SECRET_KEY")
	if stripeKey == "" {
		log.Fatal("STRIPE_SECRET_KEY not set in environment")
	}
	stripe.Key = stripeKey
}

// Fonction auxiliaire pour obtenir les variables d'environnement avec une valeur par défaut
func getEnv(key, defaultValue string) string {
	value := os.Getenv(key)
	if value == "" {
		return defaultValue
	}
	return value
}
