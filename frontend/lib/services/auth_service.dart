import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
// AUTH : connexion, déconnexion, profil utilisateur
class AuthService {
  final String baseUrl = 'http://217.69.9.54:8080'; // URL de votre backend

  // Méthode pour récupérer le profil de l'utilisateur
  Future<Map<String, dynamic>> getProfile() async {
    final token = await getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Erreur lors de la récupération du profil");
    }
  }

  Future<String?> login(String username, String password) async {
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
      final Map<String, dynamic> data = jsonDecode(response.body);
      final token = data['token'];

      // Stocker le token dans les SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwtToken', token);

      return token;
    } else {
      return null;
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
  }

  // Nouvelle méthode pour récupérer les infos utilisateur
  Future<User?> getUserProfile({String? username}) async {
    final token = await getToken();
    if (token == null) return null;

    // Si aucun `username` n'est passé, on essaie de l'extraire depuis le token JWT
    if (username == null) {
      username = extractUsernameFromToken(token); // À implémenter
      if (username == null) return null;
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user/$username'), // Modifier l'URL en fonction de l'API backend
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      return null;
    }
  }


  String? extractUsernameFromToken(String token) {
    // Divise le token JWT en ses trois parties : en-tête, payload et signature
    final parts = token.split('.');
    if (parts.length != 3) {
      return null; // Si le token n'est pas correct, renvoie null
    }

    // Décode la partie payload (base64Url) du token
    final payload = base64Url.decode(base64Url.normalize(parts[1]));
    final Map<String, dynamic> decodedPayload = jsonDecode(utf8.decode(payload));

    // Récupère le `username` à partir du payload (assurez-vous que votre token contient bien cette information)
    return decodedPayload['username'];
  }
}
