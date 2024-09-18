# Étape 1 : Construire le binaire Go
FROM golang:1.18 AS builder

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier les fichiers du projet dans le répertoire de travail
COPY . .

# Télécharger les dépendances
RUN go mod download

# Compiler l'application
RUN go build -o main ./cmd/main.go

# Étape 2 : Créer l'image de production
FROM debian:buster-slim

# Définir le répertoire de travail pour l'image de production
WORKDIR /app

# Copier le binaire Go compilé depuis l'étape de build
COPY --from=builder /app/main .

# Exposer le port sur lequel l'application s'exécute
EXPOSE 8080

# Démarrer l'application
CMD ["./main"]
