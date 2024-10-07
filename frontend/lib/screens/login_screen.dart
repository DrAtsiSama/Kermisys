import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'chat_screen.dart'; // Importation de l'écran de chat

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _errorMessage;

  Future<void> _login() async {
    print('Tentative de connexion...');
    final username = _usernameController.text;
    final password = _passwordController.text;
    print("password user : " + password + "   " + username);
    final token = await _authService.login(username, password);

    print("token");
    if (token != null) {
      setState(() {
        _errorMessage = null; // Effacer le message d'erreur
      });

      // Afficher le token dans la console
      print('Token JWT : $token');

      // Navigation vers la page de chat avec les IDs des utilisateurs
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(
            currentUserId: '12', // Remplace par l'ID de l'utilisateur connecté
            recipientId: '4',   // Remplace par l'ID du destinataire
          ),
        ),
      );
    } else {
      // Afficher le message d'erreur
      setState(() {
        _errorMessage = "Nom d'utilisateur ou mot de passe incorrect";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Se connecter'),
            ),
            if (_errorMessage != null) ...[
              SizedBox(height: 20),
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
