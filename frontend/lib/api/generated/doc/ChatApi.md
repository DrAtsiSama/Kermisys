# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**wsHistoryGet**](ChatApi.md#wshistoryget) | **GET** /ws/history | Récupérer l'historique des messages


# **wsHistoryGet**
> List<ModelsChatMessage> wsHistoryGet(senderId, receiverId, limit, page)

Récupérer l'historique des messages

Récupère l'historique des messages entre deux utilisateurs, avec pagination

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ChatApi();
final senderId = senderId_example; // String | ID de l'expéditeur
final receiverId = receiverId_example; // String | ID du destinataire
final limit = 56; // int | Nombre de messages à récupérer
final page = 56; // int | Numéro de page

try {
    final result = api_instance.wsHistoryGet(senderId, receiverId, limit, page);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->wsHistoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **senderId** | **String**| ID de l'expéditeur | 
 **receiverId** | **String**| ID du destinataire | 
 **limit** | **int**| Nombre de messages à récupérer | [optional] [default to 50]
 **page** | **int**| Numéro de page | [optional] [default to 1]

### Return type

[**List<ModelsChatMessage>**](ModelsChatMessage.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

