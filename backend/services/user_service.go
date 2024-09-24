package services

type User struct {
	ID       uint
	Username string
	Email    string
	Role     string
}

// Définir quelques utilisateurs d'exemple avec des ID et des adresses email
var users = map[string]User{
	"user1": {ID: 1, Username: "user1", Email: "user1@example.com", Role: "admin"},
	"user2": {ID: 2, Username: "user2", Email: "user2@example.com", Role: "parent"},
}

// GetUser retourne un utilisateur par son nom d'utilisateur
func GetUser(username string) (User, bool) {
	user, exists := users[username]
	return user, exists
}

// CreateUser ajoute un nouvel utilisateur au map
func CreateUser(username, role string) {
	newID := uint(len(users) + 1) // Génère un nouvel ID en fonction du nombre d'utilisateurs existants
	users[username] = User{ID: newID, Username: username, Email: username + "@example.com", Role: role}
}
