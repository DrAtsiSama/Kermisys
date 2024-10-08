import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/kermesse.dart';
import 'auth_service.dart';
// Kermesse : récupérer, rejoindre, quitter une kermesse
class KermesseService {
  final String baseUrl = 'http://217.69.9.54:8080'; // URL de votre backend
  final AuthService _authService = AuthService();

  // Vérifie si l'utilisateur a rejoint la kermesse
  Future<bool> isUserJoined(int kermesseId) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.get(
      Uri.parse('$baseUrl/kermesses/joined/$kermesseId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['joined']; // Réponse attendue { "joined": true/false }
    } else {
      throw Exception('Erreur lors de la vérification de l\'inscription à la kermesse');
    }
  }

  // Quitter une kermesse
  Future<void> leaveKermesse(int kermesseId) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.post(
      Uri.parse('$baseUrl/kermesses/leave/$kermesseId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors du désinscription à la kermesse');
    }
  }

  // Rejoindre une kermesse
  Future<void> joinKermesse(int kermesseId) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.post(
      Uri.parse('$baseUrl/kermesses/join/$kermesseId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de l\'inscription à la kermesse');
    }
  }

  Future<List<Kermesse>> fetchKermesses({int page = 1, int limit = 10}) async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/kermesses?page=$page&limit=$limit'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Décoder la réponse et créer une liste d'objets Kermesse
      final List<dynamic> kermessesJson = jsonDecode(response.body);
      return kermessesJson.map((json) => Kermesse.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des kermesses');
    }
  }


  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }
}

