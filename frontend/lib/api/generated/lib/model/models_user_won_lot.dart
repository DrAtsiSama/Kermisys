//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsUserWonLot {
  /// Returns a new [ModelsUserWonLot] instance.
  ModelsUserWonLot({
    this.id,
    this.lotId,
    this.tombolaId,
    this.userId,
    this.wonAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lotId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? tombolaId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? wonAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsUserWonLot &&
    other.id == id &&
    other.lotId == lotId &&
    other.tombolaId == tombolaId &&
    other.userId == userId &&
    other.wonAt == wonAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (lotId == null ? 0 : lotId!.hashCode) +
    (tombolaId == null ? 0 : tombolaId!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (wonAt == null ? 0 : wonAt!.hashCode);

  @override
  String toString() => 'ModelsUserWonLot[id=$id, lotId=$lotId, tombolaId=$tombolaId, userId=$userId, wonAt=$wonAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.lotId != null) {
      json[r'lot_id'] = this.lotId;
    } else {
      json[r'lot_id'] = null;
    }
    if (this.tombolaId != null) {
      json[r'tombola_id'] = this.tombolaId;
    } else {
      json[r'tombola_id'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.wonAt != null) {
      json[r'won_at'] = this.wonAt;
    } else {
      json[r'won_at'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsUserWonLot] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsUserWonLot? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsUserWonLot[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsUserWonLot[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsUserWonLot(
        id: mapValueOfType<int>(json, r'id'),
        lotId: mapValueOfType<int>(json, r'lot_id'),
        tombolaId: mapValueOfType<int>(json, r'tombola_id'),
        userId: mapValueOfType<int>(json, r'user_id'),
        wonAt: mapValueOfType<String>(json, r'won_at'),
      );
    }
    return null;
  }

  static List<ModelsUserWonLot> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsUserWonLot>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsUserWonLot.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsUserWonLot> mapFromJson(dynamic json) {
    final map = <String, ModelsUserWonLot>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsUserWonLot.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsUserWonLot-objects as value to a dart map
  static Map<String, List<ModelsUserWonLot>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsUserWonLot>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsUserWonLot.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

