import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChildService {
  final String baseUrl = 'http://217.69.9.54:8080';

  Future<List<String>> getChildren() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/parent/children'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // Suppose que le backend renvoie une liste de noms d'utilisateur
      return data.cast<String>();
    } else {
      throw Exception('Erreur lors de la récupération des enfants');
    }
  }

  Future<void> addChild(String childUsername) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/parent/add-child'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'child_username': childUsername}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de l\'ajout de l\'enfant');
    }
  }

  Future<void> removeChild(String childUsername) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/parent/remove-child'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'child_username': childUsername}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la suppression de l\'enfant');
    }
  }

  Future<void> distributeTokens(int amount, String childUsername) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/parent/distribute-tokens'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
        'child_username': childUsername,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la distribution des jetons');
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }
}
