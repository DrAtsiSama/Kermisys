# Kermisys - Gestion de Kermesses 🎉

Kermisys est un projet SaaS conçu pour la gestion de kermesses scolaires, permettant aux participants d'interagir avec des stands, d'acheter des jetons, et de participer à des tombolas. Le projet inclut une application mobile et un backend pour gérer les différentes fonctionnalités.

---

## Table des matières
- [Technologies utilisées](#technologies-utilisées)
- [Fonctionnalités](#fonctionnalités)
- [Installation](#installation)
- [To-Do List](#to-do-list)
  - [Backend](#backend)
  - [Frontend](#frontend)
- [Contributeurs](#contributeurs)

---

## Technologies utilisées

### Backend :
- **Golang** avec Gin pour le framework web.
- **PostgreSQL** pour la base de données.
- **Swagger** pour la documentation d'API.
- **JWT** pour l'authentification.
- **Docker** pour la conteneurisation du backend et de la base de données.

### Frontend :
- **Flutter** pour l'application mobile (iOS & Android) et Web.
- **HTTP** ou **WebSockets** pour la communication avec le backend.

---

## Fonctionnalités

### Gestion des participants
- **Élève** : 
  - Peut interagir avec un stand via des jetons.
  - Peut acheter des billets de tombola.
  
- **Parent** :
  - Peut acheter des jetons avec de l'argent réel.
  - Peut distribuer des jetons à ses enfants.
  - Peut visualiser les interactions de ses enfants avec les stands.

- **Teneur de stand** :
  - Peut gérer les stocks (nourriture, boisson).
  - Peut faire payer les consommations ou activités en jetons.
  - Peut attribuer des points aux participants des activités.

- **Organisateur** :
  - Peut visualiser tous les stands et gérer les stocks.
  - Peut visualiser les recettes (jetons achetés, utilisés).
  - Peut gérer les lots et organiser le tirage de la tombola.
  - Peut visualiser le classement des points des participants.

### Gestion des Kermesses
- Ajout, modification, suppression de kermesses.
- Gestion d'un plan interactif des stands.
- Gestion des lots de tombola.
- Gestion des participants et des stands liés à la kermesse.

---

## Installation

### Backend
1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/toncompte/kermisys/backend.git
   cd backend
