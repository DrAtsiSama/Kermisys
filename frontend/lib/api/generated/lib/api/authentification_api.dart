//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthentificationApi {
  AuthentificationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Mot de passe oublié
  ///
  /// Envoie un lien de réinitialisation à l'utilisateur
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  Future<Response> forgotPasswordPostWithHttpInfo(String email,) async {
    // ignore: prefer_const_declarations
    final path = r'/forgot-password';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (email != null) {
      formParams[r'email'] = parameterToString(email);
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

  /// Mot de passe oublié
  ///
  /// Envoie un lien de réinitialisation à l'utilisateur
  ///
  /// Parameters:
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  Future<ModelsMessageResponse?> forgotPasswordPost(String email,) async {
    final response = await forgotPasswordPostWithHttpInfo(email,);
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

  /// Connexion
  ///
  /// Authentifie un utilisateur et retourne un jeton JWT
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] password (required):
  ///   Mot de passe
  Future<Response> loginPostWithHttpInfo(String username, String password,) async {
    // ignore: prefer_const_declarations
    final path = r'/login';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
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

  /// Connexion
  ///
  /// Authentifie un utilisateur et retourne un jeton JWT
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] password (required):
  ///   Mot de passe
  Future<ModelsLoginResponse?> loginPost(String username, String password,) async {
    final response = await loginPostWithHttpInfo(username, password,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsLoginResponse',) as ModelsLoginResponse;
    
    }
    return null;
  }

  /// Déconnexion
  ///
  /// Déconnexion de l'utilisateur
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> logoutPostWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/logout';

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

  /// Déconnexion
  ///
  /// Déconnexion de l'utilisateur
  Future<ModelsMessageResponse?> logoutPost() async {
    final response = await logoutPostWithHttpInfo();
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

  /// Inscription
  ///
  /// Crée un nouvel utilisateur avec le rôle \"parent\" par défaut
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] password (required):
  ///   Mot de passe
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  Future<Response> registerPostWithHttpInfo(String username, String password, String email,) async {
    // ignore: prefer_const_declarations
    final path = r'/register';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
    }
    if (password != null) {
      formParams[r'password'] = parameterToString(password);
    }
    if (email != null) {
      formParams[r'email'] = parameterToString(email);
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

  /// Inscription
  ///
  /// Crée un nouvel utilisateur avec le rôle \"parent\" par défaut
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///   Nom d'utilisateur
  ///
  /// * [String] password (required):
  ///   Mot de passe
  ///
  /// * [String] email (required):
  ///   Adresse e-mail
  Future<ModelsMessageResponse?> registerPost(String username, String password, String email,) async {
    final response = await registerPostWithHttpInfo(username, password, email,);
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

  /// Réinitialiser le mot de passe
  ///
  /// Permet à un utilisateur de réinitialiser son mot de passe
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] token (required):
  ///   Token de réinitialisation
  ///
  /// * [String] newPassword (required):
  ///   Nouveau mot de passe
  Future<Response> resetPasswordPostWithHttpInfo(String token, String newPassword,) async {
    // ignore: prefer_const_declarations
    final path = r'/reset-password';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded'];

    if (token != null) {
      formParams[r'token'] = parameterToString(token);
    }
    if (newPassword != null) {
      formParams[r'newPassword'] = parameterToString(newPassword);
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

  /// Réinitialiser le mot de passe
  ///
  /// Permet à un utilisateur de réinitialiser son mot de passe
  ///
  /// Parameters:
  ///
  /// * [String] token (required):
  ///   Token de réinitialisation
  ///
  /// * [String] newPassword (required):
  ///   Nouveau mot de passe
  Future<ModelsMessageResponse?> resetPasswordPost(String token, String newPassword,) async {
    final response = await resetPasswordPostWithHttpInfo(token, newPassword,);
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
}
