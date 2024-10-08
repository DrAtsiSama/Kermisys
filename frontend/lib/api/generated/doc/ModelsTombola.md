# openapi.model.ModelsTombola

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**createdAt** | **String** |  | [optional] 
**id** | **int** |  | [optional] 
**kermesseId** | **int** |  | [optional] 
**lots** | [**List<ModelsLot>**](ModelsLot.md) | Relation avec les lots | [optional] [default to const []]
**name** | **String** |  | [optional] 
**organisateurs** | [**List<ModelsUser>**](ModelsUser.md) | Relation avec les organisateurs | [optional] [default to const []]
**tickets** | [**List<ModelsTicket>**](ModelsTicket.md) | Relation avec les tickets | [optional] [default to const []]
**updatedAt** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


