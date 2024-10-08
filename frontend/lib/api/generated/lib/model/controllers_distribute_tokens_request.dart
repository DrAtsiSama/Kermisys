//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ControllersDistributeTokensRequest {
  /// Returns a new [ControllersDistributeTokensRequest] instance.
  ControllersDistributeTokensRequest({
    this.amount,
    this.child,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? child;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ControllersDistributeTokensRequest &&
    other.amount == amount &&
    other.child == child;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (child == null ? 0 : child!.hashCode);

  @override
  String toString() => 'ControllersDistributeTokensRequest[amount=$amount, child=$child]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.child != null) {
      json[r'child'] = this.child;
    } else {
      json[r'child'] = null;
    }
    return json;
  }

  /// Returns a new [ControllersDistributeTokensRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ControllersDistributeTokensRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ControllersDistributeTokensRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ControllersDistributeTokensRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ControllersDistributeTokensRequest(
        amount: mapValueOfType<int>(json, r'amount'),
        child: mapValueOfType<String>(json, r'child'),
      );
    }
    return null;
  }

  static List<ControllersDistributeTokensRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ControllersDistributeTokensRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ControllersDistributeTokensRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ControllersDistributeTokensRequest> mapFromJson(dynamic json) {
    final map = <String, ControllersDistributeTokensRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ControllersDistributeTokensRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ControllersDistributeTokensRequest-objects as value to a dart map
  static Map<String, List<ControllersDistributeTokensRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ControllersDistributeTokensRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ControllersDistributeTokensRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

