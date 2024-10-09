import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// Token : achat et distribution de jetons
class TokenService {
  final String baseUrl = 'http://217.69.9.54:8080';

  Future<void> buyTokens(int userId, int amount) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/parent/achat/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
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
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
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

  // Nouvelle méthode pour créer un Payment Intent
  Future<String> createPaymentIntent(int amount) async {
    final token = await getToken();
    final url = Uri.parse('$baseUrl/payments');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'kermesse_id': 1, // Remplacez par l'ID réel de la kermesse
        'stand_id': 1,    // Remplacez par l'ID réel du stand
        'amount': amount * 100, // Montant en centimes
        'currency': 'eur',
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['client_secret'];
    } else {
      final errorData = json.decode(response.body);
      throw Exception('Échec de la création du Payment Intent : ${errorData['error']}');
    }
  }

}
