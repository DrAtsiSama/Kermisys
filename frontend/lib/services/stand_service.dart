import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/standModel.dart';
import 'auth_service.dart'; // Import du service d'authentification

class StandService {
  final String baseUrl = 'http://217.69.9.54:8080';
  final AuthService _authService = AuthService(); // Instance du service d'authentification

  // Récupérer les stands d'une kermesse avec pagination
  Future<List<Stand>> getStandsByKermesseId({int? kermesseId, int page = 1, int limit = 10}) async {
    final token = await AuthService().getToken();
    if (token == null) throw Exception("Token non disponible");

    // Construire l'URL avec ou sans le paramètre kermesseId
    String url = '$baseUrl/stands?page=$page&limit=$limit';
    if (kermesseId != null) {
      url += '&kermesse_id=$kermesseId';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map((json) {
        if (json['ID'] != null && json['name'] != null && json['type'] != null) {
          return Stand.fromJson(json); // Conversion JSON vers Stand
        } else {
          print("Données du stand manquantes ou invalides : $json");
          return null;
        }
      })
          .where((stand) => stand != null)
          .cast<Stand>()
          .toList();
    } else {
      throw Exception("Erreur lors de la récupération des stands : ${response.body}");
    }
  }

  // Interaction avec un stand (acheter un article, jouer à un jeu, etc.)
  Future<int> interactWithStand(int standId, String action, {int quantity = 1}) async {
    final token = await _authService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/stands/$standId/interact?action=$action&quantity=$quantity'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final int newStock = responseData['new_stock'];
      return newStock;
    } else {
      throw Exception('Erreur lors de l\'interaction avec le stand');
    }
  }

  // Créer un nouveau stand lié à la kermesse actuelle (kermesseId passé via le bouton)
  Future<void> createStand({
    required String name,
    required String type,
    required String description,
    required int stock,
    required int kermesseId,  // Ce champ est implicite et récupéré de l'écran où le bouton est activé
  }) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.post(
      Uri.parse('$baseUrl/stands'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'type': type,
        'description': description,
        'stock': stock,
        'kermesse_id': kermesseId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Erreur lors de la création du stand");
    }
  }


  // Méthode pour supprimer un stand
  Future<void> deleteStand(int standId) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.delete(
      Uri.parse('$baseUrl/stands/$standId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 204) {
      throw Exception("Erreur lors de la suppression du stand");
    }
  }

  // Méthode pour modifier un stand
  Future<void> updateStand(int standId, String name, String type, String description, int stock) async {
    final token = await _authService.getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.put(
      Uri.parse('$baseUrl/stands/$standId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'type': type,
        'description': description,
        'stock': stock,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Erreur lors de la modification du stand");
    }
  }
}
