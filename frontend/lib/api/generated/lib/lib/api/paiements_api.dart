//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PaiementsApi {
  PaiementsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Processus de paiement
  ///
  /// Traite une demande de paiement en fonction des détails fournis
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ModelsPaymentRequest] paymentData (required):
  ///   Données de paiement
  Future<Response> paymentsPostWithHttpInfo(ModelsPaymentRequest paymentData,) async {
    // ignore: prefer_const_declarations
    final path = r'/payments';

    // ignore: prefer_final_locals
    Object? postBody = paymentData;

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

  /// Processus de paiement
  ///
  /// Traite une demande de paiement en fonction des détails fournis
  ///
  /// Parameters:
  ///
  /// * [ModelsPaymentRequest] paymentData (required):
  ///   Données de paiement
  Future<ModelsTransaction?> paymentsPost(ModelsPaymentRequest paymentData,) async {
    final response = await paymentsPostWithHttpInfo(paymentData,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ModelsTransaction',) as ModelsTransaction;
    
    }
    return null;
  }

  /// Récupérer les transactions d'un utilisateur
  ///
  /// Récupère toutes les transactions liées à un utilisateur
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] userID (required):
  ///   ID de l'utilisateur
  Future<Response> paymentsUserUserIDGetWithHttpInfo(int userID,) async {
    // ignore: prefer_const_declarations
    final path = r'/payments/user/{userID}'
      .replaceAll('{userID}', userID.toString());

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

  /// Récupérer les transactions d'un utilisateur
  ///
  /// Récupère toutes les transactions liées à un utilisateur
  ///
  /// Parameters:
  ///
  /// * [int] userID (required):
  ///   ID de l'utilisateur
  Future<List<ModelsTransaction>?> paymentsUserUserIDGet(int userID,) async {
    final response = await paymentsUserUserIDGetWithHttpInfo(userID,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ModelsTransaction>') as List)
        .cast<ModelsTransaction>()
        .toList(growable: false);

    }
    return null;
  }
}
