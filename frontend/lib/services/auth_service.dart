import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://217.69.9.54:8080';

  Future<String?> login(String username, String password) async {
    // Log des informations envoyées
    print('Tentative de connexion avec :');
    print('Username: $username');
    print('Password: $password');

    try {
      // Effectuer la requête POST
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': username,
          'password': password,
        },
      );

      // Log de la réponse brute
      print('Réponse reçue du serveur :');
      print('Statut de la réponse : ${response.statusCode}');
      print('Corps de la réponse : ${response.body}');

      if (response.statusCode == 200) {
        // Log de la réponse déchiffrée
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('Réponse décodée : $data');

        // Vérifier si le token est présent
        if (data.containsKey('token')) {
          print('Token reçu : ${data['token']}');
          return data['token'];
        } else {
          print('Token non présent dans la réponse.');
          return null;
        }
      } else {
        print('Erreur lors de la connexion : ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Log de toute erreur rencontrée
      print('Erreur lors de la requête : $e');
      return null;
    }
  }
}
