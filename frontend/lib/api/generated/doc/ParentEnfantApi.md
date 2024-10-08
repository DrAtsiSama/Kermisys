# openapi.api.ParentEnfantApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userChildrenChildIdDelete**](ParentEnfantApi.md#userchildrenchildiddelete) | **DELETE** /user/children/{child_id} | Supprimer un enfant associé à un parent
[**userChildrenGet**](ParentEnfantApi.md#userchildrenget) | **GET** /user/children | Liste des enfants associés à un parent
[**userParentRequestsAcceptIdPut**](ParentEnfantApi.md#userparentrequestsacceptidput) | **PUT** /user/parent-requests/accept/{id} | Accepter une demande parent-enfant
[**userParentRequestsPost**](ParentEnfantApi.md#userparentrequestspost) | **POST** /user/parent-requests | Ajouter une demande parent-enfant
[**userParentRequestsRejectIdPut**](ParentEnfantApi.md#userparentrequestsrejectidput) | **PUT** /user/parent-requests/reject/{id} | Refuser une demande parent-enfant
[**userParentRequestsRequestsGet**](ParentEnfantApi.md#userparentrequestsrequestsget) | **GET** /user/parent-requests/requests | Liste des demandes parent-enfant pour l'utilisateur connecté


# **userChildrenChildIdDelete**
> ModelsUser userChildrenChildIdDelete(childId)

Supprimer un enfant associé à un parent

Permet de désassocier un enfant d'un parent et de lui réassigner le rôle par défaut \"parent\"

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();
final childId = 56; // int | ID de l'enfant

try {
    final result = api_instance.userChildrenChildIdDelete(childId);
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userChildrenChildIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **childId** | **int**| ID de l'enfant | 

### Return type

[**ModelsUser**](ModelsUser.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userChildrenGet**
> List<ModelsUser> userChildrenGet()

Liste des enfants associés à un parent

Renvoie la liste de tous les enfants associés à un parent spécifique

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();

try {
    final result = api_instance.userChildrenGet();
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userChildrenGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ModelsUser>**](ModelsUser.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userParentRequestsAcceptIdPut**
> ModelsParentChildRequest userParentRequestsAcceptIdPut(id)

Accepter une demande parent-enfant

Permet d'accepter une demande existante pour lier un parent et un enfant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();
final id = 56; // int | ID de la demande

try {
    final result = api_instance.userParentRequestsAcceptIdPut(id);
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userParentRequestsAcceptIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID de la demande | 

### Return type

[**ModelsParentChildRequest**](ModelsParentChildRequest.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userParentRequestsPost**
> ModelsParentChildRequest userParentRequestsPost(userParentRequestsPostRequest)

Ajouter une demande parent-enfant

Permet de créer une nouvelle demande pour lier un parent et un enfant en utilisant leurs noms d'utilisateur

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();
final userParentRequestsPostRequest = UserParentRequestsPostRequest(); // UserParentRequestsPostRequest | 

try {
    final result = api_instance.userParentRequestsPost(userParentRequestsPostRequest);
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userParentRequestsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userParentRequestsPostRequest** | [**UserParentRequestsPostRequest**](UserParentRequestsPostRequest.md)|  | 

### Return type

[**ModelsParentChildRequest**](ModelsParentChildRequest.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userParentRequestsRejectIdPut**
> ModelsParentChildRequest userParentRequestsRejectIdPut(id)

Refuser une demande parent-enfant

Permet de refuser une demande existante pour lier un parent et un enfant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();
final id = 56; // int | ID de la demande

try {
    final result = api_instance.userParentRequestsRejectIdPut(id);
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userParentRequestsRejectIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID de la demande | 

### Return type

[**ModelsParentChildRequest**](ModelsParentChildRequest.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userParentRequestsRequestsGet**
> List<ModelsParentChildRequest> userParentRequestsRequestsGet()

Liste des demandes parent-enfant pour l'utilisateur connecté

Renvoie la liste de toutes les demandes en attente de traitement pour l'utilisateur connecté

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api_instance = ParentEnfantApi();

try {
    final result = api_instance.userParentRequestsRequestsGet();
    print(result);
} catch (e) {
    print('Exception when calling ParentEnfantApi->userParentRequestsRequestsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ModelsParentChildRequest>**](ModelsParentChildRequest.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

