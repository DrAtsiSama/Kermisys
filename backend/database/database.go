package database

import (
    "gorm.io/driver/postgres"
    "gorm.io/gorm"
    "log"
)

var DB *gorm.DB

func Connect() {
    dsn := "host=localhost user=postgres password=yourpassword dbname=kermesse port=5432 sslmode=disable"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
    if err != nil {
        log.Fatal("Erreur de connexion à la base de données:", err)
    }
    DB = db
}
