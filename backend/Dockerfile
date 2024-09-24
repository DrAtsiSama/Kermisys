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
RUN apk --no-cache add libc6-compat

# Définir le répertoire de travail pour l'image de production
WORKDIR /app

# Copier le binaire Go compilé depuis l'étape de build
COPY --from=builder /app/main .

# Exposer le port sur lequel l'application s'exécute
EXPOSE 8080

# Démarrer l'application
CMD ["./main"]
