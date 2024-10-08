//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TombolasApi {
  TombolasApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Créer une tombola
  ///
  /// Crée une nouvelle tombola (réservé aux organisateurs ou aux admins)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<Response> tombolasCreateKermesseIdPostWithHttpInfo(int kermesseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/create/{kermesse_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Créer une tombola
  ///
  /// Crée une nouvelle tombola (réservé aux organisateurs ou aux admins)
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<ModelsTombola?> tombolasCreateKermesseIdPost(int kermesseId,) async {
    final response = await tombolasCreateKermesseIdPostWithHttpInfo(kermesseId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsTombola',) as ModelsTombola;
    
    }
    return null;
  }

  /// Acheter un ticket de tombola
  ///
  /// Permet à un utilisateur d'acheter un ticket de tombola (maximum 1 par kermesse)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<Response> tombolasTombolaIdBuyTicketPostWithHttpInfo(int tombolaId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/buy-ticket'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Acheter un ticket de tombola
  ///
  /// Permet à un utilisateur d'acheter un ticket de tombola (maximum 1 par kermesse)
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<String?> tombolasTombolaIdBuyTicketPost(int tombolaId,) async {
    final response = await tombolasTombolaIdBuyTicketPostWithHttpInfo(tombolaId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Supprimer une tombola
  ///
  /// Supprime une tombola existante (réservé aux organisateurs ou admins)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<Response> tombolasTombolaIdDeleteDeleteWithHttpInfo(int tombolaId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/delete'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Supprimer une tombola
  ///
  /// Supprime une tombola existante (réservé aux organisateurs ou admins)
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<String?> tombolasTombolaIdDeleteDelete(int tombolaId,) async {
    final response = await tombolasTombolaIdDeleteDeleteWithHttpInfo(tombolaId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Tirage au sort d'une tombola
  ///
  /// Permet de réaliser le tirage au sort d'une tombola et d'annoncer le gagnant
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<Response> tombolasTombolaIdDrawPostWithHttpInfo(int tombolaId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/draw'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Tirage au sort d'une tombola
  ///
  /// Permet de réaliser le tirage au sort d'une tombola et d'annoncer le gagnant
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<ControllersWinnerResponse?> tombolasTombolaIdDrawPost(int tombolaId,) async {
    final response = await tombolasTombolaIdDrawPostWithHttpInfo(tombolaId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ControllersWinnerResponse',) as ControllersWinnerResponse;
    
    }
    return null;
  }

  /// Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)
  ///
  /// Modifie une tombola existante (réservé aux organisateurs ou admins)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [ModelsTombola] tombola (required):
  ///   Nouveaux détails de la tombola (nom et KermesseID)
  Future<Response> tombolasTombolaIdEditPutWithHttpInfo(int tombolaId, ModelsTombola tombola,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/edit'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody = tombola;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)
  ///
  /// Modifie une tombola existante (réservé aux organisateurs ou admins)
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [ModelsTombola] tombola (required):
  ///   Nouveaux détails de la tombola (nom et KermesseID)
  Future<ModelsTombola?> tombolasTombolaIdEditPut(int tombolaId, ModelsTombola tombola,) async {
    final response = await tombolasTombolaIdEditPutWithHttpInfo(tombolaId, tombola,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsTombola',) as ModelsTombola;
    
    }
    return null;
  }

  /// Afficher une tombola avec ses lots
  ///
  /// Permet d'afficher une tombola et les lots associés
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<Response> tombolasTombolaIdGetWithHttpInfo(int tombolaId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Afficher une tombola avec ses lots
  ///
  /// Permet d'afficher une tombola et les lots associés
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<ModelsTombola?> tombolasTombolaIdGet(int tombolaId,) async {
    final response = await tombolasTombolaIdGetWithHttpInfo(tombolaId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsTombola',) as ModelsTombola;
    
    }
    return null;
  }

  /// Retirer un lot d'une tombola
  ///
  /// Permet de retirer un lot d'une tombola (réservé aux organisateurs ou admins)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [int] lotId (required):
  ///   ID du lot
  Future<Response> tombolasTombolaIdLotLotIdDeleteWithHttpInfo(int tombolaId, int lotId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/lot/{lot_id}'
      .replaceAll('{tombola_id}', tombolaId.toString())
      .replaceAll('{lot_id}', lotId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retirer un lot d'une tombola
  ///
  /// Permet de retirer un lot d'une tombola (réservé aux organisateurs ou admins)
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [int] lotId (required):
  ///   ID du lot
  Future<String?> tombolasTombolaIdLotLotIdDelete(int tombolaId, int lotId,) async {
    final response = await tombolasTombolaIdLotLotIdDeleteWithHttpInfo(tombolaId, lotId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Ajouter un lot à une tombola
  ///
  /// Permet d'ajouter un lot à une tombola (réservé aux organisateurs ou admins)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [ModelsLot] lot (required):
  ///   Lot à ajouter
  Future<Response> tombolasTombolaIdLotPostWithHttpInfo(int tombolaId, ModelsLot lot,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/lot'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody = lot;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Ajouter un lot à une tombola
  ///
  /// Permet d'ajouter un lot à une tombola (réservé aux organisateurs ou admins)
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  ///
  /// * [ModelsLot] lot (required):
  ///   Lot à ajouter
  Future<String?> tombolasTombolaIdLotPost(int tombolaId, ModelsLot lot,) async {
    final response = await tombolasTombolaIdLotPostWithHttpInfo(tombolaId, lot,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Récupérer les lots gagnés par un utilisateur
  ///
  /// Permet de récupérer la liste des lots gagnés par l'utilisateur pour une tombola donnée
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<Response> tombolasTombolaIdLotsWonGetWithHttpInfo(int tombolaId,) async {
    // ignore: prefer_const_declarations
    final path = r'/tombolas/{tombola_id}/lots-won'
      .replaceAll('{tombola_id}', tombolaId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Récupérer les lots gagnés par un utilisateur
  ///
  /// Permet de récupérer la liste des lots gagnés par l'utilisateur pour une tombola donnée
  ///
  /// Parameters:
  ///
  /// * [int] tombolaId (required):
  ///   ID de la tombola
  Future<List<ModelsLot>?> tombolasTombolaIdLotsWonGet(int tombolaId,) async {
    final response = await tombolasTombolaIdLotsWonGetWithHttpInfo(tombolaId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsLot>') as List)
        .cast<ModelsLot>()
        .toList(growable: false);

    }
    return null;
  }
}
