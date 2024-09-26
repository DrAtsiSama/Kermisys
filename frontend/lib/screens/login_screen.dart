import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';

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
      // Effacer le message d'erreur
      setState(() {
        _errorMessage = null;
      });

      // Afficher un message de succès avec le token
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Connexion réussie ! Token JWT : $token'),
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              // Masquer le SnackBar
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );

      // Afficher le token dans la console
      print('Token JWT : $token');

      // Rediriger vers une autre page si nécessaire (par exemple, une page d'accueil)
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
