# openapi.api.TombolasApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tombolasCreateKermesseIdPost**](TombolasApi.md#tombolascreatekermesseidpost) | **POST** /tombolas/create/{kermesse_id} | Créer une tombola
[**tombolasTombolaIdBuyTicketPost**](TombolasApi.md#tombolastombolaidbuyticketpost) | **POST** /tombolas/{tombola_id}/buy-ticket | Acheter un ticket de tombola
[**tombolasTombolaIdDeleteDelete**](TombolasApi.md#tombolastombolaiddeletedelete) | **DELETE** /tombolas/{tombola_id}/delete | Supprimer une tombola
[**tombolasTombolaIdDrawPost**](TombolasApi.md#tombolastombolaiddrawpost) | **POST** /tombolas/{tombola_id}/draw | Tirage au sort d'une tombola
[**tombolasTombolaIdEditPut**](TombolasApi.md#tombolastombolaideditput) | **PUT** /tombolas/{tombola_id}/edit | Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)
[**tombolasTombolaIdGet**](TombolasApi.md#tombolastombolaidget) | **GET** /tombolas/{tombola_id} | Afficher une tombola avec ses lots
[**tombolasTombolaIdLotLotIdDelete**](TombolasApi.md#tombolastombolaidlotlotiddelete) | **DELETE** /tombolas/{tombola_id}/lot/{lot_id} | Retirer un lot d'une tombola
[**tombolasTombolaIdLotPost**](TombolasApi.md#tombolastombolaidlotpost) | **POST** /tombolas/{tombola_id}/lot | Ajouter un lot à une tombola
[**tombolasTombolaIdLotsWonGet**](TombolasApi.md#tombolastombolaidlotswonget) | **GET** /tombolas/{tombola_id}/lots-won | Récupérer les lots gagnés par un utilisateur


# **tombolasCreateKermesseIdPost**
> ModelsTombola tombolasCreateKermesseIdPost(kermesseId)

Créer une tombola

Crée une nouvelle tombola (réservé aux organisateurs ou aux admins)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final kermesseId = 56; // int | ID de la kermesse

try {
    final result = api_instance.tombolasCreateKermesseIdPost(kermesseId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasCreateKermesseIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kermesseId** | **int**| ID de la kermesse | 

### Return type

[**ModelsTombola**](ModelsTombola.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdBuyTicketPost**
> String tombolasTombolaIdBuyTicketPost(tombolaId)

Acheter un ticket de tombola

Permet à un utilisateur d'acheter un ticket de tombola (maximum 1 par kermesse)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola

try {
    final result = api_instance.tombolasTombolaIdBuyTicketPost(tombolaId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdBuyTicketPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdDeleteDelete**
> String tombolasTombolaIdDeleteDelete(tombolaId)

Supprimer une tombola

Supprime une tombola existante (réservé aux organisateurs ou admins)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola

try {
    final result = api_instance.tombolasTombolaIdDeleteDelete(tombolaId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdDrawPost**
> ControllersWinnerResponse tombolasTombolaIdDrawPost(tombolaId)

Tirage au sort d'une tombola

Permet de réaliser le tirage au sort d'une tombola et d'annoncer le gagnant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola

try {
    final result = api_instance.tombolasTombolaIdDrawPost(tombolaId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdDrawPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 

### Return type

[**ControllersWinnerResponse**](ControllersWinnerResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdEditPut**
> ModelsTombola tombolasTombolaIdEditPut(tombolaId, tombola)

Modifier une tombola (seul le nom et la KermesseID peuvent être modifiés)

Modifie une tombola existante (réservé aux organisateurs ou admins)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola
final tombola = ModelsTombola(); // ModelsTombola | Nouveaux détails de la tombola (nom et KermesseID)

try {
    final result = api_instance.tombolasTombolaIdEditPut(tombolaId, tombola);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdEditPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 
 **tombola** | [**ModelsTombola**](ModelsTombola.md)| Nouveaux détails de la tombola (nom et KermesseID) | 

### Return type

[**ModelsTombola**](ModelsTombola.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdGet**
> ModelsTombola tombolasTombolaIdGet(tombolaId)

Afficher une tombola avec ses lots

Permet d'afficher une tombola et les lots associés

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola

try {
    final result = api_instance.tombolasTombolaIdGet(tombolaId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 

### Return type

[**ModelsTombola**](ModelsTombola.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdLotLotIdDelete**
> String tombolasTombolaIdLotLotIdDelete(tombolaId, lotId)

Retirer un lot d'une tombola

Permet de retirer un lot d'une tombola (réservé aux organisateurs ou admins)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola
final lotId = 56; // int | ID du lot

try {
    final result = api_instance.tombolasTombolaIdLotLotIdDelete(tombolaId, lotId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdLotLotIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 
 **lotId** | **int**| ID du lot | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdLotPost**
> String tombolasTombolaIdLotPost(tombolaId, lot)

Ajouter un lot à une tombola

Permet d'ajouter un lot à une tombola (réservé aux organisateurs ou admins)

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola
final lot = ModelsLot(); // ModelsLot | Lot à ajouter

try {
    final result = api_instance.tombolasTombolaIdLotPost(tombolaId, lot);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdLotPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 
 **lot** | [**ModelsLot**](ModelsLot.md)| Lot à ajouter | 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tombolasTombolaIdLotsWonGet**
> List<ModelsLot> tombolasTombolaIdLotsWonGet(tombolaId)

Récupérer les lots gagnés par un utilisateur

Permet de récupérer la liste des lots gagnés par l'utilisateur pour une tombola donnée

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = TombolasApi();
final tombolaId = 56; // int | ID de la tombola

try {
    final result = api_instance.tombolasTombolaIdLotsWonGet(tombolaId);
    print(result);
} catch (e) {
    print('Exception when calling TombolasApi->tombolasTombolaIdLotsWonGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tombolaId** | **int**| ID de la tombola | 

### Return type

[**List<ModelsLot>**](ModelsLot.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

