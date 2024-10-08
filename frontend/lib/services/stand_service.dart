import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/standModel.dart';
import 'auth_service.dart'; // Import du service d'authentification

// Stand : récupérer les stands, interagir avec un stand
class StandService {
  final String baseUrl = 'http://217.69.9.54:8080';
  final AuthService _authService = AuthService(); // Instance du service d'authentification

  // Récupérer les stands d'une kermesse
  Future<List<Stand>> getStandsByKermesseId(int kermesseId) async {
    final token = await _authService.getToken(); // Utilisation de l'instance pour appeler getToken
    if (token == null) throw Exception("Token non disponible");
    final response = await http.get(
      Uri.parse('$baseUrl/stands'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print('GetStand ID: ${kermesseId} - content : ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Stand.fromJson(json)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des stands");
    }
  }

  // Interaction avec un stand
  Future<void> interactWithStand(int standId, String action, {int quantity = 1}) async {
    final token = await _authService.getToken(); // Appel correct de getToken
    if (token == null) throw Exception("Token non disponible");

    final response = await http.post(
      Uri.parse('$baseUrl/stands/$standId/interact?action=$action&quantity=$quantity'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de l\'interaction avec le stand');
    }
  }
}
