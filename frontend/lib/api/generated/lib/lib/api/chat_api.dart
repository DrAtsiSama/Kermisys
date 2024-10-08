//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ChatApi {
  ChatApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Récupérer l'historique des messages
  ///
  /// Récupère l'historique des messages entre deux utilisateurs, avec pagination
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] senderId (required):
  ///   ID de l'expéditeur
  ///
  /// * [String] receiverId (required):
  ///   ID du destinataire
  ///
  /// * [int] limit:
  ///   Nombre de messages à récupérer
  ///
  /// * [int] page:
  ///   Numéro de page
  Future<Response> wsHistoryGetWithHttpInfo(String senderId, String receiverId, { int? limit, int? page, }) async {
    // ignore: prefer_const_declarations
    final path = r'/ws/history';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'sender_id', senderId));
      queryParams.addAll(_queryParams('', 'receiver_id', receiverId));
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
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

  /// Récupérer l'historique des messages
  ///
  /// Récupère l'historique des messages entre deux utilisateurs, avec pagination
  ///
  /// Parameters:
  ///
  /// * [String] senderId (required):
  ///   ID de l'expéditeur
  ///
  /// * [String] receiverId (required):
  ///   ID du destinataire
  ///
  /// * [int] limit:
  ///   Nombre de messages à récupérer
  ///
  /// * [int] page:
  ///   Numéro de page
  Future<List<ModelsChatMessage>?> wsHistoryGet(String senderId, String receiverId, { int? limit, int? page, }) async {
    final response = await wsHistoryGetWithHttpInfo(senderId, receiverId,  limit: limit, page: page, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsChatMessage>') as List)
        .cast<ModelsChatMessage>()
        .toList(growable: false);

    }
    return null;
  }
}
