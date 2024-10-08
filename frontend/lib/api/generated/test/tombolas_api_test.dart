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


/// tests for TombolasApi
void main() {
  // final instance = TombolasApi();

  group('tests for TombolasApi', () {
    // Créer une tombola
    //
    // Crée une nouvelle tombola (réservé aux organisateurs ou aux admins)
    //
    //Future<ModelsTombola> tombolasCreateKermesseIdPost(int kermesseId) async
    test('test tombolasCreateKermesseIdPost', () async {
      // TODO
    });

    // Acheter un ticket de tombola
    //
    // Permet à un utilisateur d'acheter un ticket de tombola (maximum 1 par kermesse)
    //
    //Future<String> tombolasTombolaIdBuyTicketPost(int tombolaId) async
    test('test tombolasTombolaIdBuyTicketPost', () async {
      // TODO
    });

    // Supprimer une tombola
    //
    // Supprime une tombola existante (réservé aux organisateurs ou admins)
    //
    //Future<String> tombolasTombolaIdDeleteDelete(int tombolaId) async
    test('test tombolasTombolaIdDeleteDelete', () async {
      // TODO
    });

    // Tirage au sort d'une tombola
    //
    // Permet de réaliser le tirage au sort d'une tombola et d'annoncer le gagnant
    //
    //Future<ControllersWinnerResponse> tombolasTombolaIdDrawPost(int tombolaId) async
    test('test tombolasTombolaIdDrawPost', () async {
      // TODO
    });

    // Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)
    //
    // Modifie une tombola existante (réservé aux organisateurs ou admins)
    //
    //Future<ModelsTombola> tombolasTombolaIdEditPut(int tombolaId, ModelsTombola tombola) async
    test('test tombolasTombolaIdEditPut', () async {
      // TODO
    });

    // Afficher une tombola avec ses lots
    //
    // Permet d'afficher une tombola et les lots associés
    //
    //Future<ModelsTombola> tombolasTombolaIdGet(int tombolaId) async
    test('test tombolasTombolaIdGet', () async {
      // TODO
    });

    // Retirer un lot d'une tombola
    //
    // Permet de retirer un lot d'une tombola (réservé aux organisateurs ou admins)
    //
    //Future<String> tombolasTombolaIdLotLotIdDelete(int tombolaId, int lotId) async
    test('test tombolasTombolaIdLotLotIdDelete', () async {
      // TODO
    });

    // Ajouter un lot à une tombola
    //
    // Permet d'ajouter un lot à une tombola (réservé aux organisateurs ou admins)
    //
    //Future<String> tombolasTombolaIdLotPost(int tombolaId, ModelsLot lot) async
    test('test tombolasTombolaIdLotPost', () async {
      // TODO
    });

    // Récupérer les lots gagnés par un utilisateur
    //
    // Permet de récupérer la liste des lots gagnés par l'utilisateur pour une tombola donnée
    //
    //Future<List<ModelsLot>> tombolasTombolaIdLotsWonGet(int tombolaId) async
    test('test tombolasTombolaIdLotsWonGet', () async {
      // TODO
    });

  });
}
