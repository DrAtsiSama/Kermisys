//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for StandsApi
void main() {
  // final instance = StandsApi();

  group('tests for StandsApi', () {
    // Supprimer un score pour un utilisateur et un stand
    //
    // Permet à un gérant de stand ou organisateur de supprimer le score d'un utilisateur pour un stand spécifique d'une kermesse
    //
    //Future<String> kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete(int kermesseId, int standId, int userId) async
    test('test kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete', () async {
      // TODO
    });

    // Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand
    //
    // Permet à un organisateur ou admin d'ajouter ou de mettre à jour le score d'un utilisateur pour un stand spécifique
    //
    //Future<String> kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost(int kermesseId, int standId, int userId, ModelsScoreRequest score) async
    test('test kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost', () async {
      // TODO
    });

    // Récupérer tous les stands avec pagination
    //
    // Récupère la liste de tous les stands avec pagination
    //
    //Future<List<ModelsStand>> standsGet({ int page, int limit }) async
    test('test standsGet', () async {
      // TODO
    });

    // Supprimer un stand
    //
    // Supprime un stand par son ID
    //
    //Future<String> standsIdDelete(int id) async
    test('test standsIdDelete', () async {
      // TODO
    });

    // Récupérer un stand par ID
    //
    // Récupère les détails d'un stand par son ID
    //
    //Future<ModelsStand> standsIdGet(int id) async
    test('test standsIdGet', () async {
      // TODO
    });

    // Interagir avec un stand
    //
    // Permet à un utilisateur d'interagir avec un stand spécifique
    //
    //Future<String> standsIdInteractPost(int id, String action, { int quantity }) async
    test('test standsIdInteractPost', () async {
      // TODO
    });

    // Mettre à jour un stand
    //
    // Met à jour les détails d'un stand existant
    //
    //Future<ModelsStand> standsIdPut(int id, ModelsStand stand) async
    test('test standsIdPut', () async {
      // TODO
    });

    // Créer un stand
    //
    // Ajoute un nouveau stand et associe l'utilisateur créateur en tant que propriétaire
    //
    //Future<ModelsStand> standsPost(ModelsStand stand) async
    test('test standsPost', () async {
      // TODO
    });

    // Récupérer le score d'un joueur pour un stand spécifique
    //
    // Retourne le score d'un joueur pour un stand spécifique
    //
    //Future<ModelsPlayerScore> standsStandIdPlayersUserIdScoreGet(int standId, int userId) async
    test('test standsStandIdPlayersUserIdScoreGet', () async {
      // TODO
    });

  });
}
