# openapi.api.StandsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete**](StandsApi.md#kermesseskermesseidstandsstandidplayerscoresuseriddelete) | **DELETE** /kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id} | Supprimer un score pour un utilisateur et un stand
[**kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost**](StandsApi.md#kermesseskermesseidstandsstandidplayerscoresuseridpost) | **POST** /kermesses/{kermesse_id}/stands/{stand_id}/player-scores/{user_id} | Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand
[**standsGet**](StandsApi.md#standsget) | **GET** /stands | Récupérer tous les stands avec pagination
[**standsIdDelete**](StandsApi.md#standsiddelete) | **DELETE** /stands/{id} | Supprimer un stand
[**standsIdGet**](StandsApi.md#standsidget) | **GET** /stands/{id} | Récupérer un stand par ID
[**standsIdInteractPost**](StandsApi.md#standsidinteractpost) | **POST** /stands/{id}/interact | Interagir avec un stand
[**standsIdPut**](StandsApi.md#standsidput) | **PUT** /stands/{id} | Mettre à jour un stand
[**standsPost**](StandsApi.md#standspost) | **POST** /stands | Créer un stand
[**standsStandIdPlayersUserIdScoreGet**](StandsApi.md#standsstandidplayersuseridscoreget) | **GET** /stands/{stand_id}/players/{user_id}/score | Récupérer le score d'un joueur pour un stand spécifique


# **kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete**
> String kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete(kermesseId, standId, userId)

Supprimer un score pour un utilisateur et un stand

Permet à un gérant de stand ou organisateur de supprimer le score d'un utilisateur pour un stand spécifique d'une kermesse

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final kermesseId = 56; // int | ID de la kermesse
final standId = 56; // int | ID du stand
final userId = 56; // int | ID de l'utilisateur

try {
    final result = api_instance.kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete(kermesseId, standId, userId);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->kermessesKermesseIdStandsStandIdPlayerScoresUserIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 
 **standId** | **int**| ID du stand | 
 **userId** | **int**| ID de l'utilisateur | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost**
> String kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost(kermesseId, standId, userId, score)

Ajouter ou mettre à jour un score pour un utilisateur spécifique et un stand

Permet à un organisateur ou admin d'ajouter ou de mettre à jour le score d'un utilisateur pour un stand spécifique

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final kermesseId = 56; // int | ID de la kermesse
final standId = 56; // int | ID du stand
final userId = 56; // int | ID de l'utilisateur
final score = ModelsScoreRequest(); // ModelsScoreRequest | Score à ajouter

try {
    final result = api_instance.kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost(kermesseId, standId, userId, score);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->kermessesKermesseIdStandsStandIdPlayerScoresUserIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 
 **standId** | **int**| ID du stand | 
 **userId** | **int**| ID de l'utilisateur | 
 **score** | [**ModelsScoreRequest**](ModelsScoreRequest.md)| Score à ajouter | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsGet**
> List<ModelsStand> standsGet(page, limit)

Récupérer tous les stands avec pagination

Récupère la liste de tous les stands avec pagination

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final page = 56; // int | Numéro de la page
final limit = 56; // int | Nombre d'éléments par page

try {
    final result = api_instance.standsGet(page, limit);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Numéro de la page | [optional] [default to 1]
 **limit** | **int**| Nombre d'éléments par page | [optional] [default to 10]

### Return type

[**List<ModelsStand>**](ModelsStand.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsIdDelete**
> String standsIdDelete(id)

Supprimer un stand

Supprime un stand par son ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final id = 56; // int | ID du stand

try {
    final result = api_instance.standsIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID du stand | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsIdGet**
> ModelsStand standsIdGet(id)

Récupérer un stand par ID

Récupère les détails d'un stand par son ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final id = 56; // int | ID du stand

try {
    final result = api_instance.standsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID du stand | 

### Return type

[**ModelsStand**](ModelsStand.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsIdInteractPost**
> String standsIdInteractPost(id, action, quantity)

Interagir avec un stand

Permet à un utilisateur d'interagir avec un stand spécifique

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final id = 56; // int | ID du stand
final action = action_example; // String | Action effectuée (ex: 'buy_item', 'play_game')
final quantity = 56; // int | Quantité à affecter (par défaut 1)

try {
    final result = api_instance.standsIdInteractPost(id, action, quantity);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsIdInteractPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID du stand | 
 **action** | **String**| Action effectuée (ex: 'buy_item', 'play_game') | 
 **quantity** | **int**| Quantité à affecter (par défaut 1) | [optional] 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsIdPut**
> ModelsStand standsIdPut(id, stand)

Mettre à jour un stand

Met à jour les détails d'un stand existant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final id = 56; // int | ID du stand
final stand = ModelsStand(); // ModelsStand | Détails du stand

try {
    final result = api_instance.standsIdPut(id, stand);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID du stand | 
 **stand** | [**ModelsStand**](ModelsStand.md)| Détails du stand | 

### Return type

[**ModelsStand**](ModelsStand.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsPost**
> ModelsStand standsPost(stand)

Créer un stand

Ajoute un nouveau stand et associe l'utilisateur créateur en tant que propriétaire

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final stand = ModelsStand(); // ModelsStand | Détails du stand (Nom, Description, etc.)

try {
    final result = api_instance.standsPost(stand);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stand** | [**ModelsStand**](ModelsStand.md)| Détails du stand (Nom, Description, etc.) | 

### Return type

[**ModelsStand**](ModelsStand.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standsStandIdPlayersUserIdScoreGet**
> ModelsPlayerScore standsStandIdPlayersUserIdScoreGet(standId, userId)

Récupérer le score d'un joueur pour un stand spécifique

Retourne le score d'un joueur pour un stand spécifique

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = StandsApi();
final standId = 56; // int | ID du stand
final userId = 56; // int | ID de l'utilisateur

try {
    final result = api_instance.standsStandIdPlayersUserIdScoreGet(standId, userId);
    print(result);
} catch (e) {
    print('Exception when calling StandsApi->standsStandIdPlayersUserIdScoreGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **standId** | **int**| ID du stand | 
 **userId** | **int**| ID de l'utilisateur | 

### Return type

[**ModelsPlayerScore**](ModelsPlayerScore.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

