# openapi.model.ModelsKermesse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**createdAt** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**endDate** | **String** |  | [optional] 
**id** | **int** |  | [optional] 
**location** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**organisateurs** | [**List<ModelsUser>**](ModelsUser.md) | Relation many-to-many avec les organisateurs | [optional] [default to const []]
**participants** | [**List<ModelsUser>**](ModelsUser.md) | Relation many-to-many avec les participants | [optional] [default to const []]
**stands** | [**List<ModelsStand>**](ModelsStand.md) | Association one-to-many avec les stands | [optional] [default to const []]
**startDate** | **String** |  | [optional] 
**updatedAt** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


