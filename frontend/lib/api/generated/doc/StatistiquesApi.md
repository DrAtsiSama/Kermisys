# openapi.api.StatistiquesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**statsKermesseIdGet**](StatistiquesApi.md#statskermesseidget) | **GET** /stats/kermesse/{id} | Obtenir les statistiques de la kermesse
[**statsOrganisateurIdGet**](StatistiquesApi.md#statsorganisateuridget) | **GET** /stats/organisateur/{id} | Obtenir les statistiques de l'organisateur
[**statsStandIdGet**](StatistiquesApi.md#statsstandidget) | **GET** /stats/stand/{id} | Obtenir les statistiques d'un stand


# **statsKermesseIdGet**
> ModelsKermesseStats statsKermesseIdGet(id)

Obtenir les statistiques de la kermesse

Récupère les statistiques de la kermesse par ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StatistiquesApi();
final id = 56; // int | ID de la kermesse

try {
    final result = api_instance.statsKermesseIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling StatistiquesApi->statsKermesseIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID de la kermesse | 

### Return type

[**ModelsKermesseStats**](ModelsKermesseStats.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statsOrganisateurIdGet**
> ModelsOrganisateurStats statsOrganisateurIdGet(id)

Obtenir les statistiques de l'organisateur

Récupère les statistiques de l'organisateur par ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StatistiquesApi();
final id = 56; // int | ID de l'organisateur

try {
    final result = api_instance.statsOrganisateurIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling StatistiquesApi->statsOrganisateurIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID de l'organisateur | 

### Return type

[**ModelsOrganisateurStats**](ModelsOrganisateurStats.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statsStandIdGet**
> ModelsStandStats statsStandIdGet(id)

Obtenir les statistiques d'un stand

Récupère les statistiques d'un stand par ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StatistiquesApi();
final id = 56; // int | ID du stand

try {
    final result = api_instance.statsStandIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling StatistiquesApi->statsStandIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID du stand | 

### Return type

[**ModelsStandStats**](ModelsStandStats.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

