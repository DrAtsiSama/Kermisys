//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatistiquesApi {
  StatistiquesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Obtenir les statistiques de la kermesse
  ///
  /// Récupère les statistiques de la kermesse par ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la kermesse
  Future<Response> statsKermesseIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/stats/kermesse/{id}'
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

  /// Obtenir les statistiques de la kermesse
  ///
  /// Récupère les statistiques de la kermesse par ID
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la kermesse
  Future<ModelsKermesseStats?> statsKermesseIdGet(int id,) async {
    final response = await statsKermesseIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsKermesseStats',) as ModelsKermesseStats;
    
    }
    return null;
  }

  /// Obtenir les statistiques de l'organisateur
  ///
  /// Récupère les statistiques de l'organisateur par ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de l'organisateur
  Future<Response> statsOrganisateurIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/stats/organisateur/{id}'
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

  /// Obtenir les statistiques de l'organisateur
  ///
  /// Récupère les statistiques de l'organisateur par ID
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de l'organisateur
  Future<ModelsOrganisateurStats?> statsOrganisateurIdGet(int id,) async {
    final response = await statsOrganisateurIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsOrganisateurStats',) as ModelsOrganisateurStats;
    
    }
    return null;
  }

  /// Obtenir les statistiques d'un stand
  ///
  /// Récupère les statistiques d'un stand par ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<Response> statsStandIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/stats/stand/{id}'
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

  /// Obtenir les statistiques d'un stand
  ///
  /// Récupère les statistiques d'un stand par ID
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID du stand
  Future<ModelsStandStats?> statsStandIdGet(int id,) async {
    final response = await statsStandIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsStandStats',) as ModelsStandStats;
    
    }
    return null;
  }
}
