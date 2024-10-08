//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WebSocketApi {
  WebSocketApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// WebSocket Chat Privé
  ///
  /// Établit une connexion WebSocket pour la discussion privée en temps réel entre un organisateur et un gérant de stand
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userID (required):
  ///   Identifiant de l'utilisateur (ex : username)
  Future<Response> wsPrivateGetWithHttpInfo(String userID,) async {
    // ignore: prefer_const_declarations
    final path = r'/ws/private';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'userID', userID));

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

  /// WebSocket Chat Privé
  ///
  /// Établit une connexion WebSocket pour la discussion privée en temps réel entre un organisateur et un gérant de stand
  ///
  /// Parameters:
  ///
  /// * [String] userID (required):
  ///   Identifiant de l'utilisateur (ex : username)
  Future<void> wsPrivateGet(String userID,) async {
    final response = await wsPrivateGetWithHttpInfo(userID,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
