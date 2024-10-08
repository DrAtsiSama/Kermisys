//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ParentEnfantApi {
  ParentEnfantApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Supprimer un enfant associé à un parent
  ///
  /// Permet de désassocier un enfant d'un parent et de lui réassigner le rôle par défaut \"parent\"
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] childId (required):
  ///   ID de l'enfant
  Future<Response> userChildrenChildIdDeleteWithHttpInfo(int childId,) async {
    // ignore: prefer_const_declarations
    final path = r'/user/children/{child_id}'
      .replaceAll('{child_id}', childId.toString());

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

  /// Supprimer un enfant associé à un parent
  ///
  /// Permet de désassocier un enfant d'un parent et de lui réassigner le rôle par défaut \"parent\"
  ///
  /// Parameters:
  ///
  /// * [int] childId (required):
  ///   ID de l'enfant
  Future<ModelsUser?> userChildrenChildIdDelete(int childId,) async {
    final response = await userChildrenChildIdDeleteWithHttpInfo(childId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsUser',) as ModelsUser;
    
    }
    return null;
  }

  /// Liste des enfants associés à un parent
  ///
  /// Renvoie la liste de tous les enfants associés à un parent spécifique
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> userChildrenGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/user/children';

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

  /// Liste des enfants associés à un parent
  ///
  /// Renvoie la liste de tous les enfants associés à un parent spécifique
  Future<List<ModelsUser>?> userChildrenGet() async {
    final response = await userChildrenGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsUser>') as List)
        .cast<ModelsUser>()
        .toList(growable: false);

    }
    return null;
  }

  /// Accepter une demande parent-enfant
  ///
  /// Permet d'accepter une demande existante pour lier un parent et un enfant
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la demande
  Future<Response> userParentRequestsAcceptIdPutWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/user/parent-requests/accept/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

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

  /// Accepter une demande parent-enfant
  ///
  /// Permet d'accepter une demande existante pour lier un parent et un enfant
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la demande
  Future<ModelsParentChildRequest?> userParentRequestsAcceptIdPut(int id,) async {
    final response = await userParentRequestsAcceptIdPutWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsParentChildRequest',) as ModelsParentChildRequest;
    
    }
    return null;
  }

  /// Ajouter une demande parent-enfant
  ///
  /// Permet de créer une nouvelle demande pour lier un parent et un enfant en utilisant leurs noms d'utilisateur
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserParentRequestsPostRequest] userParentRequestsPostRequest (required):
  Future<Response> userParentRequestsPostWithHttpInfo(UserParentRequestsPostRequest userParentRequestsPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/user/parent-requests';

    // ignore: prefer_final_locals
    Object? postBody = userParentRequestsPostRequest;

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

  /// Ajouter une demande parent-enfant
  ///
  /// Permet de créer une nouvelle demande pour lier un parent et un enfant en utilisant leurs noms d'utilisateur
  ///
  /// Parameters:
  ///
  /// * [UserParentRequestsPostRequest] userParentRequestsPostRequest (required):
  Future<ModelsParentChildRequest?> userParentRequestsPost(UserParentRequestsPostRequest userParentRequestsPostRequest,) async {
    final response = await userParentRequestsPostWithHttpInfo(userParentRequestsPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsParentChildRequest',) as ModelsParentChildRequest;
    
    }
    return null;
  }

  /// Refuser une demande parent-enfant
  ///
  /// Permet de refuser une demande existante pour lier un parent et un enfant
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la demande
  Future<Response> userParentRequestsRejectIdPutWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/user/parent-requests/reject/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

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

  /// Refuser une demande parent-enfant
  ///
  /// Permet de refuser une demande existante pour lier un parent et un enfant
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   ID de la demande
  Future<ModelsParentChildRequest?> userParentRequestsRejectIdPut(int id,) async {
    final response = await userParentRequestsRejectIdPutWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsParentChildRequest',) as ModelsParentChildRequest;
    
    }
    return null;
  }

  /// Liste des demandes parent-enfant pour l'utilisateur connecté
  ///
  /// Renvoie la liste de toutes les demandes en attente de traitement pour l'utilisateur connecté
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> userParentRequestsRequestsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/user/parent-requests/requests';

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

  /// Liste des demandes parent-enfant pour l'utilisateur connecté
  ///
  /// Renvoie la liste de toutes les demandes en attente de traitement pour l'utilisateur connecté
  Future<List<ModelsParentChildRequest>?> userParentRequestsRequestsGet() async {
    final response = await userParentRequestsRequestsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsParentChildRequest>') as List)
        .cast<ModelsParentChildRequest>()
        .toList(growable: false);

    }
    return null;
  }
}
