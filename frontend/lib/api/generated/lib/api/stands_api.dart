//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StandsApi {
  StandsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Supprimer un score pour un utilisateur et un stand
  ///
  /// Permet à un gérant de stand ou organisateur de supprimer le score d'un utilisateur pour un stand spécifique d'une kermesse
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<Response> kermessesKermesseIdStandsStandIdPlayerScoresUserIdDeleteWithHttpInfo(int kermesseId, int standId, int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString())
      .replaceAll('{stand_id}', standId.toString())
      .replaceAll('{user_id}', userId.toString());

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

  /// Supprimer un score pour un utilisateur et un stand
  ///
  /// Permet à un gérant de stand ou organisateur de supprimer le score d'un utilisateur pour un stand spécifique d'une kermesse
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<String?> kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete(int kermesseId, int standId, int userId,) async {
    final response = await kermessesKermesseIdStandsStandIdPlayerScoresUserIdDeleteWithHttpInfo(kermesseId, standId, userId,);
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

  /// Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand
  ///
  /// Permet à un organisateur ou admin d'ajouter ou de mettre à jour le score d'un utilisateur pour un stand spécifique
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  ///
  /// * [ModelsScoreRequest] score (required):
  ///   Score à ajouter
  Future<Response> kermessesKermesseIdStandsStandIdPlayerScoresUserIdPostWithHttpInfo(int kermesseId, int standId, int userId, ModelsScoreRequest score,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString())
      .replaceAll('{stand_id}', standId.toString())
      .replaceAll('{user_id}', userId.toString());

    // ignore: prefer_final_locals
    Object? postBody = score;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand
  ///
  /// Permet à un organisateur ou admin d'ajouter ou de mettre à jour le score d'un utilisateur pour un stand spécifique
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  ///
  /// * [ModelsScoreRequest] score (required):
  ///   Score à ajouter
  Future<String?> kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost(int kermesseId, int standId, int userId, ModelsScoreRequest score,) async {
    final response = await kermessesKermesseIdStandsStandIdPlayerScoresUserIdPostWithHttpInfo(kermesseId, standId, userId, score,);
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

  /// Récupérer tous les stands avec pagination
  ///
  /// Récupère la liste de tous les stands avec pagination
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Numéro de la page
  ///
  /// * [int] limit:
  ///   Nombre d'éléments par page
  Future<Response> standsGetWithHttpInfo({ int? page, int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/stands';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }

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

  /// Récupérer tous les stands avec pagination
  ///
  /// Récupère la liste de tous les stands avec pagination
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Numéro de la page
  ///
  /// * [int] limit:
  ///   Nombre d'éléments par page
  Future<List<ModelsStand>?> standsGet({ int? page, int? limit, }) async {
    final response = await standsGetWithHttpInfo( page: page, limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsStand>') as List)
        .cast<ModelsStand>()
        .toList(growable: false);

    }
    return null;
  }

  /// Supprimer un stand
  ///
  /// Supprime un stand par son ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<Response> standsIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/stands/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Supprimer un stand
  ///
  /// Supprime un stand par son ID
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<String?> standsIdDelete(int id,) async {
    final response = await standsIdDeleteWithHttpInfo(id,);
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

  /// Récupérer un stand par ID
  ///
  /// Récupère les détails d'un stand par son ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<Response> standsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/stands/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Récupérer un stand par ID
  ///
  /// Récupère les détails d'un stand par son ID
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<ModelsStand?> standsIdGet(int id,) async {
    final response = await standsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsStand',) as ModelsStand;
    
    }
    return null;
  }

  /// Interagir avec un stand
  ///
  /// Permet à un utilisateur d'interagir avec un stand spécifique
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  ///
  /// * [String] action (required):
  ///   Action effectuée (ex: 'buy_item', 'play_game')
  ///
  /// * [int] quantity:
  ///   Quantité à affecter (par défaut 1)
  Future<Response> standsIdInteractPostWithHttpInfo(int id, String action, { int? quantity, }) async {
    // ignore: prefer_const_declarations
    final path = r'/stands/{id}/interact'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'action', action));
    if (quantity != null) {
      queryParams.addAll(_queryParams('', 'quantity', quantity));
    }

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

  /// Interagir avec un stand
  ///
  /// Permet à un utilisateur d'interagir avec un stand spécifique
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  ///
  /// * [String] action (required):
  ///   Action effectuée (ex: 'buy_item', 'play_game')
  ///
  /// * [int] quantity:
  ///   Quantité à affecter (par défaut 1)
  Future<String?> standsIdInteractPost(int id, String action, { int? quantity, }) async {
    final response = await standsIdInteractPostWithHttpInfo(id, action,  quantity: quantity, );
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

  /// Mettre à jour un stand
  ///
  /// Met à jour les détails d'un stand existant
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  ///
  /// * [ModelsStand] stand (required):
  ///   Détails du stand
  Future<Response> standsIdPutWithHttpInfo(int id, ModelsStand stand,) async {
    // ignore: prefer_const_declarations
    final path = r'/stands/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = stand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Mettre à jour un stand
  ///
  /// Met à jour les détails d'un stand existant
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  ///
  /// * [ModelsStand] stand (required):
  ///   Détails du stand
  Future<ModelsStand?> standsIdPut(int id, ModelsStand stand,) async {
    final response = await standsIdPutWithHttpInfo(id, stand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsStand',) as ModelsStand;
    
    }
    return null;
  }

  /// Créer un stand
  ///
  /// Ajoute un nouveau stand et associe l'utilisateur créateur en tant que propriétaire
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ModelsStand] stand (required):
  ///   Détails du stand (Nom, Description, etc.)
  Future<Response> standsPostWithHttpInfo(ModelsStand stand,) async {
    // ignore: prefer_const_declarations
    final path = r'/stands';

    // ignore: prefer_final_locals
    Object? postBody = stand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Créer un stand
  ///
  /// Ajoute un nouveau stand et associe l'utilisateur créateur en tant que propriétaire
  ///
  /// Parameters:
  ///
  /// * [ModelsStand] stand (required):
  ///   Détails du stand (Nom, Description, etc.)
  Future<ModelsStand?> standsPost(ModelsStand stand,) async {
    final response = await standsPostWithHttpInfo(stand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsStand',) as ModelsStand;
    
    }
    return null;
  }

  /// Récupérer le score d'un joueur pour un stand spécifique
  ///
  /// Retourne le score d'un joueur pour un stand spécifique
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<Response> standsStandIdPlayersUserIdScoreGetWithHttpInfo(int standId, int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/stands/{stand_id}/players/{user_id}/score'
      .replaceAll('{stand_id}', standId.toString())
      .replaceAll('{user_id}', userId.toString());

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

  /// Récupérer le score d'un joueur pour un stand spécifique
  ///
  /// Retourne le score d'un joueur pour un stand spécifique
  ///
  /// Parameters:
  ///
  /// * [int] standId (required):
  ///   ID du stand
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<ModelsPlayerScore?> standsStandIdPlayersUserIdScoreGet(int standId, int userId,) async {
    final response = await standsStandIdPlayersUserIdScoreGetWithHttpInfo(standId, userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsPlayerScore',) as ModelsPlayerScore;
    
    }
    return null;
  }
}
