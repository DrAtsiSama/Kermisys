# openapi.api.WebSocketApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**wsPrivateGet**](WebSocketApi.md#wsprivateget) | **GET** /ws/private | WebSocket Chat Privé


# **wsPrivateGet**
> wsPrivateGet(userID)

WebSocket Chat Privé

Établit une connexion WebSocket pour la discussion privée en temps réel entre un organisateur et un gérant de stand

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = WebSocketApi();
final userID = userID_example; // String | Identifiant de l'utilisateur (ex : username)

try {
    api_instance.wsPrivateGet(userID);
} catch (e) {
    print('Exception when calling WebSocketApi->wsPrivateGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userID** | **String**| Identifiant de l'utilisateur (ex : username) | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

