# openapi.api.PaiementsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**paymentsPost**](PaiementsApi.md#paymentspost) | **POST** /payments | Processus de paiement
[**paymentsUserUserIDGet**](PaiementsApi.md#paymentsuseruseridget) | **GET** /payments/user/{userID} | Récupérer les transactions d'un utilisateur


# **paymentsPost**
> ModelsTransaction paymentsPost(paymentData)

Processus de paiement

Traite une demande de paiement en fonction des détails fournis

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = PaiementsApi();
final paymentData = ModelsPaymentRequest(); // ModelsPaymentRequest | Données de paiement

try {
    final result = api_instance.paymentsPost(paymentData);
    print(result);
} catch (e) {
    print('Exception when calling PaiementsApi->paymentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentData** | [**ModelsPaymentRequest**](ModelsPaymentRequest.md)| Données de paiement | 

### Return type

[**ModelsTransaction**](ModelsTransaction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **paymentsUserUserIDGet**
> List<ModelsTransaction> paymentsUserUserIDGet(userID)

Récupérer les transactions d'un utilisateur

Récupère toutes les transactions liées à un utilisateur

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = PaiementsApi();
final userID = 56; // int | ID de l'utilisateur

try {
    final result = api_instance.paymentsUserUserIDGet(userID);
    print(result);
} catch (e) {
    print('Exception when calling PaiementsApi->paymentsUserUserIDGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userID** | **int**| ID de l'utilisateur | 

### Return type

[**List<ModelsTransaction>**](ModelsTransaction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

