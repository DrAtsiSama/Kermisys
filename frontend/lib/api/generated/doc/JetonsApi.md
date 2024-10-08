# openapi.api.JetonsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**parentAchatUserIdPost**](JetonsApi.md#parentachatuseridpost) | **POST** /parent/achat/{user_id} | Achat de jetons
[**parentDistributeTokensPost**](JetonsApi.md#parentdistributetokenspost) | **POST** /parent/distribute-tokens | Distribution de jetons
[**userTokensGet**](JetonsApi.md#usertokensget) | **GET** /user/tokens | Récupérer le nombre de jetons de l'utilisateur connecté


# **parentAchatUserIdPost**
> ModelsBuyTokensResponse parentAchatUserIdPost(userId, achatRequest)

Achat de jetons

Permet à un utilisateur d'acheter des jetons après un paiement réussi

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = JetonsApi();
final userId = 56; // int | ID de l'utilisateur
final achatRequest = ControllersAchatRequest(); // ControllersAchatRequest | Nombre de jetons à acheter

try {
    final result = api_instance.parentAchatUserIdPost(userId, achatRequest);
    print(result);
} catch (e) {
    print('Exception when calling JetonsApi->parentAchatUserIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**| ID de l'utilisateur | 
 **achatRequest** | [**ControllersAchatRequest**](ControllersAchatRequest.md)| Nombre de jetons à acheter | 

### Return type

[**ModelsBuyTokensResponse**](ModelsBuyTokensResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **parentDistributeTokensPost**
> ModelsDistributeTokensResponse parentDistributeTokensPost(distributeTokensRequest)

Distribution de jetons

Permet à un parent de distribuer des jetons à son enfant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = JetonsApi();
final distributeTokensRequest = ControllersDistributeTokensRequest(); // ControllersDistributeTokensRequest | Détails de la distribution des jetons

try {
    final result = api_instance.parentDistributeTokensPost(distributeTokensRequest);
    print(result);
} catch (e) {
    print('Exception when calling JetonsApi->parentDistributeTokensPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **distributeTokensRequest** | [**ControllersDistributeTokensRequest**](ControllersDistributeTokensRequest.md)| Détails de la distribution des jetons | 

### Return type

[**ModelsDistributeTokensResponse**](ModelsDistributeTokensResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userTokensGet**
> ControllersTokenResponse userTokensGet()

Récupérer le nombre de jetons de l'utilisateur connecté

Renvoie le total des jetons disponibles pour l'utilisateur connecté

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = JetonsApi();

try {
    final result = api_instance.userTokensGet();
    print(result);
} catch (e) {
    print('Exception when calling JetonsApi->userTokensGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ControllersTokenResponse**](ControllersTokenResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

