# openapi.api.KermessesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**kermessesGet**](KermessesApi.md#kermessesget) | **GET** /kermesses | Récupérer toutes les kermesses
[**kermessesJoinKermesseIdPost**](KermessesApi.md#kermessesjoinkermesseidpost) | **POST** /kermesses/join/{kermesse_id} | Rejoindre une kermesse
[**kermessesKermesseIdDelete**](KermessesApi.md#kermesseskermesseiddelete) | **DELETE** /kermesses/{kermesse_id} | Supprimer une kermesse
[**kermessesKermesseIdGet**](KermessesApi.md#kermesseskermesseidget) | **GET** /kermesses/{kermesse_id} | Récupérer une kermesse par ID
[**kermessesKermesseIdParticipantsUserIdPost**](KermessesApi.md#kermesseskermesseidparticipantsuseridpost) | **POST** /kermesses/{kermesse_id}/participants/{user_id} | Ajouter un participant à une kermesse
[**kermessesKermesseIdPut**](KermessesApi.md#kermesseskermesseidput) | **PUT** /kermesses/{kermesse_id} | Mettre à jour une kermesse
[**kermessesKermesseIdStandsStandIdPost**](KermessesApi.md#kermesseskermesseidstandsstandidpost) | **POST** /kermesses/{kermesse_id}/stands/{stand_id} | Ajouter un stand à une kermesse
[**kermessesLeaveKermesseIdPost**](KermessesApi.md#kermessesleavekermesseidpost) | **POST** /kermesses/leave/{kermesse_id} | Quitter une kermesse
[**kermessesPost**](KermessesApi.md#kermessespost) | **POST** /kermesses | Créer une nouvelle kermesse


# **kermessesGet**
> List<ModelsKermesse> kermessesGet(page, limit, name, location, startDate)

Récupérer toutes les kermesses

Récupère la liste de toutes les kermesses avec pagination et filtres

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final page = 56; // int | Numéro de la page
final limit = 56; // int | Nombre d'éléments par page
final name = name_example; // String | Filtrer par nom de la kermesse
final location = location_example; // String | Filtrer par localisation de la kermesse
final startDate = startDate_example; // String | Filtrer par date de début (format: YYYY-MM-DD)

try {
    final result = api_instance.kermessesGet(page, limit, name, location, startDate);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Numéro de la page | [optional] 
 **limit** | **int**| Nombre d'éléments par page | [optional] 
 **name** | **String**| Filtrer par nom de la kermesse | [optional] 
 **location** | **String**| Filtrer par localisation de la kermesse | [optional] 
 **startDate** | **String**| Filtrer par date de début (format: YYYY-MM-DD) | [optional] 

### Return type

[**List<ModelsKermesse>**](ModelsKermesse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesJoinKermesseIdPost**
> String kermessesJoinKermesseIdPost(kermesseId)

Rejoindre une kermesse

Permet à un utilisateur de rejoindre une kermesse

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse

try {
    final result = api_instance.kermessesJoinKermesseIdPost(kermesseId);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesJoinKermesseIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdDelete**
> kermessesKermesseIdDelete(kermesseId)

Supprimer une kermesse

Supprime une kermesse par son ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse

try {
    api_instance.kermessesKermesseIdDelete(kermesseId);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesKermesseIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdGet**
> ModelsKermesse kermessesKermesseIdGet(kermesseId)

Récupérer une kermesse par ID

Récupère les détails d'une kermesse par son ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse

try {
    final result = api_instance.kermessesKermesseIdGet(kermesseId);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesKermesseIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 

### Return type

[**ModelsKermesse**](ModelsKermesse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdParticipantsUserIdPost**
> ModelsMessageResponse kermessesKermesseIdParticipantsUserIdPost(kermesseId, userId)

Ajouter un participant à une kermesse

Ajoute un utilisateur en tant que participant à une kermesse

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse
final userId = 56; // int | ID de l'utilisateur

try {
    final result = api_instance.kermessesKermesseIdParticipantsUserIdPost(kermesseId, userId);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesKermesseIdParticipantsUserIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 
 **userId** | **int**| ID de l'utilisateur | 

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdPut**
> ModelsKermesse kermessesKermesseIdPut(kermesseId, kermesse)

Mettre à jour une kermesse

Met à jour les détails d'une kermesse existante

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse
final kermesse = ModelsKermesse(); // ModelsKermesse | Détails mis à jour de la kermesse

try {
    final result = api_instance.kermessesKermesseIdPut(kermesseId, kermesse);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesKermesseIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 
 **kermesse** | [**ModelsKermesse**](ModelsKermesse.md)| Détails mis à jour de la kermesse | 

### Return type

[**ModelsKermesse**](ModelsKermesse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdStandsStandIdPost**
> ModelsMessageResponse kermessesKermesseIdStandsStandIdPost(kermesseId, standId)

Ajouter un stand à une kermesse

Ajoute un stand à une kermesse

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse
final standId = 56; // int | ID du stand

try {
    final result = api_instance.kermessesKermesseIdStandsStandIdPost(kermesseId, standId);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesKermesseIdStandsStandIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 
 **standId** | **int**| ID du stand | 

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesLeaveKermesseIdPost**
> String kermessesLeaveKermesseIdPost(kermesseId)

Quitter une kermesse

Permet à un utilisateur de quitter une kermesse

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesseId = 56; // int | ID de la kermesse

try {
    final result = api_instance.kermessesLeaveKermesseIdPost(kermesseId);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesLeaveKermesseIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesPost**
> ModelsKermesse kermessesPost(kermesse)

Créer une nouvelle kermesse

Crée une nouvelle kermesse avec les détails fournis

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = KermessesApi();
final kermesse = ModelsKermesse(); // ModelsKermesse | Détails de la kermesse

try {
    final result = api_instance.kermessesPost(kermesse);
    print(result);
} catch (e) {
    print('Exception when calling KermessesApi->kermessesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesse** | [**ModelsKermesse**](ModelsKermesse.md)| Détails de la kermesse | 

### Return type

[**ModelsKermesse**](ModelsKermesse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

