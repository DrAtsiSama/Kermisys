//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UtilisateursApi {
  UtilisateursApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Créer un nouvel utilisateur
  ///
  /// Crée un nouvel utilisateur avec le nom d'utilisateur, l'adresse e-mail, et le rôle spécifiés
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  ///
  /// * [String] role (required):
  ///   Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur')
  ///
  /// * [String] password (required):
  ///   Mot de passe de l'utilisateur
  Future<Response> userPostWithHttpInfo(String username, String email, String role, String password,) async {
    // ignore: prefer_const_declarations
    final path = r'/user';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
    }
    if (email != null) {
      formParams[r'email'] = parameterToString(email);
    }
    if (role != null) {
      formParams[r'role'] = parameterToString(role);
    }
    if (password != null) {
      formParams[r'password'] = parameterToString(password);
    }

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

  /// Créer un nouvel utilisateur
  ///
  /// Crée un nouvel utilisateur avec le nom d'utilisateur, l'adresse e-mail, et le rôle spécifiés
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  ///
  /// * [String] role (required):
  ///   Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur')
  ///
  /// * [String] password (required):
  ///   Mot de passe de l'utilisateur
  Future<ModelsCreateUserResponse?> userPost(String username, String email, String role, String password,) async {
    final response = await userPostWithHttpInfo(username, email, role, password,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsCreateUserResponse',) as ModelsCreateUserResponse;
    
    }
    return null;
  }

  /// Récupérer les détails d'un utilisateur
  ///
  /// Récupère les informations d'un utilisateur à partir de son nom d'utilisateur
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  Future<Response> userUsernameGetWithHttpInfo(String username,) async {
    // ignore: prefer_const_declarations
    final path = r'/user/{username}'
      .replaceAll('{username}', username);

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

  /// Récupérer les détails d'un utilisateur
  ///
  /// Récupère les informations d'un utilisateur à partir de son nom d'utilisateur
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  Future<ModelsUserResponse?> userUsernameGet(String username,) async {
    final response = await userUsernameGetWithHttpInfo(username,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsUserResponse',) as ModelsUserResponse;
    
    }
    return null;
  }
}
