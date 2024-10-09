import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  final String baseUrl = 'http://217.69.9.54:8080'; // URL de votre backend

  // Méthode pour récupérer le profil de l'utilisateur
  Future<Map<String, dynamic>> getProfile() async {
    final token = await getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.get(
      Uri.parse('$baseUrl/user/me'),
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

      // Option A : Extraire l'ID utilisateur et le rôle du token JWT
      final userId = extractUserIdFromToken(token);
      final userRole = extractUserRoleFromToken(token);

      if (userId != null && userRole != null) {
        await prefs.setInt('userId', userId);
        await prefs.setString('userRole', userRole);
        print('User ID stored: $userId');
        print('User Role stored: $userRole');
      } else {
        // Option B : Récupérer le profil de l'utilisateur pour obtenir l'ID et le rôle
        final profileData = await getProfile();
        final userId = profileData['id'];
        final userRole = profileData['role'];

        await prefs.setInt('userId', userId);
        await prefs.setString('userRole', userRole);
        print('User ID stored from profile: $userId');
        print('User Role stored from profile: $userRole');
      }

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
    await prefs.remove('userId');
    await prefs.remove('userRole');
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  Future<String?> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userRole');
  }

  // Méthode pour extraire l'ID de l'utilisateur du token
  int? extractUserIdFromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    final payload = base64Url.decode(base64Url.normalize(parts[1]));
    final Map<String, dynamic> decodedPayload = jsonDecode(utf8.decode(payload));

    // Assurez-vous que le payload contient bien l'ID de l'utilisateur
    if (decodedPayload.containsKey('userID')) {
      return decodedPayload['userID'];
    } else if (decodedPayload.containsKey('id')) {
      return decodedPayload['id'];
    } else {
      return null;
    }
  }

  // Méthode pour extraire le rôle de l'utilisateur du token
  String? extractUserRoleFromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    final payload = base64Url.decode(base64Url.normalize(parts[1]));
    final Map<String, dynamic> decodedPayload = jsonDecode(utf8.decode(payload));

    // Assurez-vous que le payload contient bien le rôle de l'utilisateur
    if (decodedPayload.containsKey('role')) {
      return decodedPayload['role'];
    } else {
      return null;
    }
  }

  // Méthode pour extraire le nom d'utilisateur du token
  String? extractUsernameFromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    final payload = base64Url.decode(base64Url.normalize(parts[1]));
    final Map<String, dynamic> decodedPayload = jsonDecode(utf8.decode(payload));

    // Assurez-vous que le payload contient bien le nom d'utilisateur
    if (decodedPayload.containsKey('username')) {
      return decodedPayload['username'];
    } else {
      return null;
    }
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

  // Nouvelle méthode pour récupérer les tokens de l'utilisateur
  Future<int?> getUserTokens() async {
    final token = await getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.get(
      Uri.parse('$baseUrl/user/tokens'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['tokens']; // Supposons que l'API renvoie un champ "tokens"
    } else {
      throw Exception("Erreur lors de la récupération des tokens");
    }
  }


  Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    return response.statusCode == 201;
  }

  Future<bool> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    return response.statusCode == 200;
  }


}
