import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/token_purchase.dart';
import 'auth_service.dart';
// Token : achat et distribution de jetons
class TokenService {
  final String baseUrl = 'http://217.69.9.54:8080';


  Future<void> buyTokens(int userId, int amount) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/parent/achat/$userId'),
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      body: jsonEncode({'amount': amount}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de l\'achat de jetons');
    }
  }

  Future<void> distributeTokens(int amount, String childUsername) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/parent/distribute-tokens'),
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      body: jsonEncode({'amount': amount, 'child': childUsername}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la distribution de jetons');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }
}
