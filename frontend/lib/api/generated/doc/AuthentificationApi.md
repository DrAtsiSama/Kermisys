# openapi.api.AuthentificationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPasswordPost**](AuthentificationApi.md#forgotpasswordpost) | **POST** /forgot-password | Mot de passe oublié
[**loginPost**](AuthentificationApi.md#loginpost) | **POST** /login | Connexion
[**logoutPost**](AuthentificationApi.md#logoutpost) | **POST** /logout | Déconnexion
[**registerPost**](AuthentificationApi.md#registerpost) | **POST** /register | Inscription
[**resetPasswordPost**](AuthentificationApi.md#resetpasswordpost) | **POST** /reset-password | Réinitialiser le mot de passe


# **forgotPasswordPost**
> ModelsMessageResponse forgotPasswordPost(email)

Mot de passe oublié

Envoie un lien de réinitialisation à l'utilisateur

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthentificationApi();
final email = email_example; // String | Adresse e-mail

try {
    final result = api_instance.forgotPasswordPost(email);
    print(result);
} catch (e) {
    print('Exception when calling AuthentificationApi->forgotPasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| Adresse e-mail | 

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginPost**
> ModelsLoginResponse loginPost(username, password)

Connexion

Authentifie un utilisateur et retourne un jeton JWT

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthentificationApi();
final username = username_example; // String | Nom d'utilisateur
final password = password_example; // String | Mot de passe

try {
    final result = api_instance.loginPost(username, password);
    print(result);
} catch (e) {
    print('Exception when calling AuthentificationApi->loginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Nom d'utilisateur | 
 **password** | **String**| Mot de passe | 

### Return type

[**ModelsLoginResponse**](ModelsLoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logoutPost**
> ModelsMessageResponse logoutPost()

Déconnexion

Déconnexion de l'utilisateur

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = AuthentificationApi();

try {
    final result = api_instance.logoutPost();
    print(result);
} catch (e) {
    print('Exception when calling AuthentificationApi->logoutPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerPost**
> ModelsMessageResponse registerPost(username, password, email)

Inscription

Crée un nouvel utilisateur avec le rôle \"parent\" par défaut

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthentificationApi();
final username = username_example; // String | Nom d'utilisateur
final password = password_example; // String | Mot de passe
final email = email_example; // String | Adresse e-mail

try {
    final result = api_instance.registerPost(username, password, email);
    print(result);
} catch (e) {
    print('Exception when calling AuthentificationApi->registerPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Nom d'utilisateur | 
 **password** | **String**| Mot de passe | 
 **email** | **String**| Adresse e-mail | 

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPasswordPost**
> ModelsMessageResponse resetPasswordPost(token, newPassword)

Réinitialiser le mot de passe

Permet à un utilisateur de réinitialiser son mot de passe

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthentificationApi();
final token = token_example; // String | Token de réinitialisation
final newPassword = newPassword_example; // String | Nouveau mot de passe

try {
    final result = api_instance.resetPasswordPost(token, newPassword);
    print(result);
} catch (e) {
    print('Exception when calling AuthentificationApi->resetPasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| Token de réinitialisation | 
 **newPassword** | **String**| Nouveau mot de passe | 

### Return type

[**ModelsMessageResponse**](ModelsMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

