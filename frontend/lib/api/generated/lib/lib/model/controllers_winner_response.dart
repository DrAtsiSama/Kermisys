//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ControllersWinnerResponse {
  /// Returns a new [ControllersWinnerResponse] instance.
  ControllersWinnerResponse({
    this.lot,
    this.winner,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ModelsLot? lot;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? winner;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ControllersWinnerResponse &&
    other.lot == lot &&
    other.winner == winner;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lot == null ? 0 : lot!.hashCode) +
    (winner == null ? 0 : winner!.hashCode);

  @override
  String toString() => 'ControllersWinnerResponse[lot=$lot, winner=$winner]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lot != null) {
      json[r'lot'] = this.lot;
    } else {
      json[r'lot'] = null;
    }
    if (this.winner != null) {
      json[r'winner'] = this.winner;
    } else {
      json[r'winner'] = null;
    }
    return json;
  }

  /// Returns a new [ControllersWinnerResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ControllersWinnerResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ControllersWinnerResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ControllersWinnerResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ControllersWinnerResponse(
        lot: ModelsLot.fromJson(json[r'lot']),
        winner: mapValueOfType<String>(json, r'winner'),
      );
    }
    return null;
  }

  static List<ControllersWinnerResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ControllersWinnerResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ControllersWinnerResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ControllersWinnerResponse> mapFromJson(dynamic json) {
    final map = <String, ControllersWinnerResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ControllersWinnerResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ControllersWinnerResponse-objects as value to a dart map
  static Map<String, List<ControllersWinnerResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ControllersWinnerResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ControllersWinnerResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

