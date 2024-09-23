package services

type User struct {
	Username string
	Role     string
}

var users = map[string]User{
	"user1": {Username: "user1", Role: "admin"},
	"user2": {Username: "user2", Role: "parent"},
}

// GetUser returns a user by username
func GetUser(username string) (User, bool) {
	user, exists := users[username]
	return user, exists
}

// CreateUser adds a new user to the map
func CreateUser(username, role string) {
	users[username] = User{Username: username, Role: role}
}
