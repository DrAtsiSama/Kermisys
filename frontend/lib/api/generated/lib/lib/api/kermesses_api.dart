//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class KermessesApi {
  KermessesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Récupérer toutes les kermesses
  ///
  /// Récupère la liste de toutes les kermesses avec pagination et filtres
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
  ///
  /// * [String] name:
  ///   Filtrer par nom de la kermesse
  ///
  /// * [String] location:
  ///   Filtrer par localisation de la kermesse
  ///
  /// * [String] startDate:
  ///   Filtrer par date de début (format: YYYY-MM-DD)
  Future<Response> kermessesGetWithHttpInfo({ int? page, int? limit, String? name, String? location, String? startDate, }) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses';

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
    if (name != null) {
      queryParams.addAll(_queryParams('', 'name', name));
    }
    if (location != null) {
      queryParams.addAll(_queryParams('', 'location', location));
    }
    if (startDate != null) {
      queryParams.addAll(_queryParams('', 'startDate', startDate));
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

  /// Récupérer toutes les kermesses
  ///
  /// Récupère la liste de toutes les kermesses avec pagination et filtres
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Numéro de la page
  ///
  /// * [int] limit:
  ///   Nombre d'éléments par page
  ///
  /// * [String] name:
  ///   Filtrer par nom de la kermesse
  ///
  /// * [String] location:
  ///   Filtrer par localisation de la kermesse
  ///
  /// * [String] startDate:
  ///   Filtrer par date de début (format: YYYY-MM-DD)
  Future<List<ModelsKermesse>?> kermessesGet({ int? page, int? limit, String? name, String? location, String? startDate, }) async {
    final response = await kermessesGetWithHttpInfo( page: page, limit: limit, name: name, location: location, startDate: startDate, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsKermesse>') as List)
        .cast<ModelsKermesse>()
        .toList(growable: false);

    }
    return null;
  }

  /// Rejoindre une kermesse
  ///
  /// Permet à un utilisateur de rejoindre une kermesse
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<Response> kermessesJoinKermesseIdPostWithHttpInfo(int kermesseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/join/{kermesse_id}'
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

  /// Rejoindre une kermesse
  ///
  /// Permet à un utilisateur de rejoindre une kermesse
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<String?> kermessesJoinKermesseIdPost(int kermesseId,) async {
    final response = await kermessesJoinKermesseIdPostWithHttpInfo(kermesseId,);
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

  /// Supprimer une kermesse
  ///
  /// Supprime une kermesse par son ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<Response> kermessesKermesseIdDeleteWithHttpInfo(int kermesseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString());

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

  /// Supprimer une kermesse
  ///
  /// Supprime une kermesse par son ID
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<void> kermessesKermesseIdDelete(int kermesseId,) async {
    final response = await kermessesKermesseIdDeleteWithHttpInfo(kermesseId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Récupérer une kermesse par ID
  ///
  /// Récupère les détails d'une kermesse par son ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<Response> kermessesKermesseIdGetWithHttpInfo(int kermesseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString());

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

  /// Récupérer une kermesse par ID
  ///
  /// Récupère les détails d'une kermesse par son ID
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<ModelsKermesse?> kermessesKermesseIdGet(int kermesseId,) async {
    final response = await kermessesKermesseIdGetWithHttpInfo(kermesseId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsKermesse',) as ModelsKermesse;
    
    }
    return null;
  }

  /// Ajouter un participant à une kermesse
  ///
  /// Ajoute un utilisateur en tant que participant à une kermesse
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<Response> kermessesKermesseIdParticipantsUserIdPostWithHttpInfo(int kermesseId, int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}/participants/{user_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString())
      .replaceAll('{user_id}', userId.toString());

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

  /// Ajouter un participant à une kermesse
  ///
  /// Ajoute un utilisateur en tant que participant à une kermesse
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] userId (required):
  ///   ID de l'utilisateur
  Future<ModelsMessageResponse?> kermessesKermesseIdParticipantsUserIdPost(int kermesseId, int userId,) async {
    final response = await kermessesKermesseIdParticipantsUserIdPostWithHttpInfo(kermesseId, userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsMessageResponse',) as ModelsMessageResponse;
    
    }
    return null;
  }

  /// Mettre à jour une kermesse
  ///
  /// Met à jour les détails d'une kermesse existante
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [ModelsKermesse] kermesse (required):
  ///   Détails mis à jour de la kermesse
  Future<Response> kermessesKermesseIdPutWithHttpInfo(int kermesseId, ModelsKermesse kermesse,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString());

    // ignore: prefer_final_locals
    Object? postBody = kermesse;

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

  /// Mettre à jour une kermesse
  ///
  /// Met à jour les détails d'une kermesse existante
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [ModelsKermesse] kermesse (required):
  ///   Détails mis à jour de la kermesse
  Future<ModelsKermesse?> kermessesKermesseIdPut(int kermesseId, ModelsKermesse kermesse,) async {
    final response = await kermessesKermesseIdPutWithHttpInfo(kermesseId, kermesse,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsKermesse',) as ModelsKermesse;
    
    }
    return null;
  }

  /// Ajouter un stand à une kermesse
  ///
  /// Ajoute un stand à une kermesse
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
  Future<Response> kermessesKermesseIdStandsStandIdPostWithHttpInfo(int kermesseId, int standId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/{kermesse_id}/stands/{stand_id}'
      .replaceAll('{kermesse_id}', kermesseId.toString())
      .replaceAll('{stand_id}', standId.toString());

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

  /// Ajouter un stand à une kermesse
  ///
  /// Ajoute un stand à une kermesse
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  ///
  /// * [int] standId (required):
  ///   ID du stand
  Future<ModelsMessageResponse?> kermessesKermesseIdStandsStandIdPost(int kermesseId, int standId,) async {
    final response = await kermessesKermesseIdStandsStandIdPostWithHttpInfo(kermesseId, standId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsMessageResponse',) as ModelsMessageResponse;
    
    }
    return null;
  }

  /// Quitter une kermesse
  ///
  /// Permet à un utilisateur de quitter une kermesse
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<Response> kermessesLeaveKermesseIdPostWithHttpInfo(int kermesseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses/leave/{kermesse_id}'
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

  /// Quitter une kermesse
  ///
  /// Permet à un utilisateur de quitter une kermesse
  ///
  /// Parameters:
  ///
  /// * [int] kermesseId (required):
  ///   ID de la kermesse
  Future<String?> kermessesLeaveKermesseIdPost(int kermesseId,) async {
    final response = await kermessesLeaveKermesseIdPostWithHttpInfo(kermesseId,);
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

  /// Créer une nouvelle kermesse
  ///
  /// Crée une nouvelle kermesse avec les détails fournis
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ModelsKermesse] kermesse (required):
  ///   Détails de la kermesse
  Future<Response> kermessesPostWithHttpInfo(ModelsKermesse kermesse,) async {
    // ignore: prefer_const_declarations
    final path = r'/kermesses';

    // ignore: prefer_final_locals
    Object? postBody = kermesse;

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

  /// Créer une nouvelle kermesse
  ///
  /// Crée une nouvelle kermesse avec les détails fournis
  ///
  /// Parameters:
  ///
  /// * [ModelsKermesse] kermesse (required):
  ///   Détails de la kermesse
  Future<ModelsKermesse?> kermessesPost(ModelsKermesse kermesse,) async {
    final response = await kermessesPostWithHttpInfo(kermesse,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsKermesse',) as ModelsKermesse;
    
    }
    return null;
  }
}
