# openapi.api.UtilisateursApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userPost**](UtilisateursApi.md#userpost) | **POST** /user | Créer un nouvel utilisateur
[**userUsernameGet**](UtilisateursApi.md#userusernameget) | **GET** /user/{username} | Récupérer les détails d'un utilisateur


# **userPost**
> ModelsCreateUserResponse userPost(username, email, role, password)

Créer un nouvel utilisateur

Crée un nouvel utilisateur avec le nom d'utilisateur, l'adresse e-mail, et le rôle spécifiés

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = UtilisateursApi();
final username = username_example; // String | Nom d'utilisateur
final email = email_example; // String | Adresse e-mail
final role = role_example; // String | Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur')
final password = password_example; // String | Mot de passe de l'utilisateur

try {
    final result = api_instance.userPost(username, email, role, password);
    print(result);
} catch (e) {
    print('Exception when calling UtilisateursApi->userPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Nom d'utilisateur | 
 **email** | **String**| Adresse e-mail | 
 **role** | **String**| Rôle de l'utilisateur (ex: 'parent', 'enfant', 'organisateur') | 
 **password** | **String**| Mot de passe de l'utilisateur | 

### Return type

[**ModelsCreateUserResponse**](ModelsCreateUserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userUsernameGet**
> ModelsUserResponse userUsernameGet(username)

Récupérer les détails d'un utilisateur

Récupère les informations d'un utilisateur à partir de son nom d'utilisateur

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = UtilisateursApi();
final username = username_example; // String | Nom d'utilisateur

try {
    final result = api_instance.userUsernameGet(username);
    print(result);
} catch (e) {
    print('Exception when calling UtilisateursApi->userUsernameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Nom d'utilisateur | 

### Return type

[**ModelsUserResponse**](ModelsUserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

