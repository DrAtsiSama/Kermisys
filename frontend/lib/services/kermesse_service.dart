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
      Uri.parse('$baseUrl/kermesses/$kermesseId/participants'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Réponse du serveur : ${response.body}');
    print('Statut du serveur : ${response.statusCode}');

    if (response.statusCode == 200) {
      // Vérifier si le corps de la réponse est vide ou égal à 'null'
      if (response.body == null || response.body.isEmpty || response.body == 'null') {
        print('La réponse est vide ou null');
        return false;
      }

      final dynamic decoded = jsonDecode(response.body);

      // Vérifier si le décodage a donné une valeur nulle
      if (decoded == null) {
        print('La réponse décodée est null');
        return false;
      }

      // Vérifier si la réponse décodée est une liste
      if (decoded is List<dynamic>) {
        final List<dynamic> data = decoded;

        // Récupération de l'ID de l'utilisateur connecté
        final currentUserId = await _authService.getUserId();

        if (currentUserId == null) {
          print('Erreur : l\'ID de l\'utilisateur est null');
          return false;
        }

        print('Current user ID: $currentUserId (${currentUserId.runtimeType})');

        // Vérifier si l'utilisateur est dans la liste des participants
        bool isJoined = data.any((participant) {
          final participantId = participant['id'];
          print('Participant ID: $participantId (${participantId.runtimeType})');

          // Conversion des identifiants en int
          int participantIdInt = (participantId as num).toInt();
          int currentUserIdInt = currentUserId;

          print('Comparaison Participant ID: $participantIdInt avec Current User ID: $currentUserIdInt');

          return participantIdInt == currentUserIdInt;
        });

        print('Is user joined: $isJoined');
        return isJoined;
      } else {
        print('La réponse décodée n\'est pas une liste');
        return false;
      }
    } else {
      throw Exception('Erreur lors de la vérification de l\'inscription à la kermesse');
    }
  }


  // Quitter une kermesse

  // Méthode pour quitter la kermesse
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

    print('Réponse du serveur pour leaveKermesse : ${response.body}');
    print('Statut du serveur pour leaveKermesse : ${response.statusCode}');

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

