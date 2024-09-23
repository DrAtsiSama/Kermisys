package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
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
		DBHost:     getEnv("DB_HOST", "localhost"),
		DBUser:     getEnv("DB_USER", "postgres"),
		DBPassword: getEnv("DB_PASSWORD", "password"),
		DBName:     getEnv("DB_NAME", "kermisys_db"),
		DBPort:     getEnv("DB_PORT", "5432"),
		JWTSecret:  getEnv("JWT_SECRET", "default_secret"), // Clé secrète pour JWT
	}
}

// Fonction auxiliaire pour obtenir les variables d'environnement avec une valeur par défaut
func getEnv(key, defaultValue string) string {
	value := os.Getenv(key)
	if value == "" {
		return defaultValue
	}
	return value
}
