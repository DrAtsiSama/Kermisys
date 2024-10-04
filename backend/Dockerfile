# Étape 1 : Construire le binaire Go
FROM golang:1.22.1-alpine AS builder

# Installer les outils nécessaires
RUN apk add --no-cache gcc musl-dev

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier les fichiers du projet dans le répertoire de travail
COPY . .

# Télécharger les dépendances
RUN go mod download

# Compiler l'application en statique (sans dépendance à glibc)
RUN go build -ldflags="-w -s" -o main ./main.go

# Étape 2 : Créer l'image de production avec Alpine
FROM alpine:latest


# Installer libc6-compat pour la compatibilité avec glibc
RUN apk --no-cache add libc6-compat bash

# Définir le répertoire de travail pour l'image de production
WORKDIR /app

# Copier le binaire Go compilé depuis l'étape de build
COPY --from=builder /app/main .

# Copier le fichier .env dans le conteneur
COPY .env .env

# Copier le script wait-for-it.sh dans l'image
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Exposer le port sur lequel l'application s'exécute
EXPOSE 8080

# Utiliser wait-for-it.sh pour attendre que PostgreSQL soit prêt avant de démarrer l'application
CMD ["wait-for-it.sh", "db:5432", "--", "./main"]
