import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String? _message;

  Future<void> _sendResetEmail() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      bool success = await _authService.forgotPassword(_email);

      if (success) {
        setState(() {
          _message = 'Un e-mail de réinitialisation a été envoyé à $_email';
        });
      } else {
        setState(() {
          _message = 'Erreur lors de l\'envoi de l\'e-mail de réinitialisation';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Veuillez entrer votre adresse e-mail. Un lien de réinitialisation de mot de passe vous sera envoyé.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Adresse e-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse e-mail';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!.trim(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendResetEmail,
              child: Text('Envoyer'),
            ),
            if (_message != null) ...[
              SizedBox(height: 20),
              Text(_message!),
            ],
          ],
        ),
      ),
    );
  }
}
