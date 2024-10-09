import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/transactionModel.dart';
import 'auth_service.dart';

class PaymentService {
  final String baseUrl = 'http://217.69.9.54:8080'; // URL de votre backend

  Future<List<Transaction>> getUserTransactions(int? userId) async {
    if (userId == null) throw Exception("User ID non disponible");

    final token = await AuthService().getToken();
    if (token == null) throw Exception("Token non disponible");

    final response = await http.get(
      Uri.parse('$baseUrl/payments/user/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des transactions");
    }
  }
}
