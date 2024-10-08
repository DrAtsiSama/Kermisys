//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsTicket {
  /// Returns a new [ModelsTicket] instance.
  ModelsTicket({
    this.id,
    this.kermesseId,
    this.tombolaId,
    this.userId,
    this.winner,
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
  int? kermesseId;

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
  bool? winner;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsTicket &&
    other.id == id &&
    other.kermesseId == kermesseId &&
    other.tombolaId == tombolaId &&
    other.userId == userId &&
    other.winner == winner;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (kermesseId == null ? 0 : kermesseId!.hashCode) +
    (tombolaId == null ? 0 : tombolaId!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (winner == null ? 0 : winner!.hashCode);

  @override
  String toString() => 'ModelsTicket[id=$id, kermesseId=$kermesseId, tombolaId=$tombolaId, userId=$userId, winner=$winner]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.kermesseId != null) {
      json[r'kermesse_id'] = this.kermesseId;
    } else {
      json[r'kermesse_id'] = null;
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
    if (this.winner != null) {
      json[r'winner'] = this.winner;
    } else {
      json[r'winner'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsTicket] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsTicket? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsTicket[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsTicket[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsTicket(
        id: mapValueOfType<int>(json, r'id'),
        kermesseId: mapValueOfType<int>(json, r'kermesse_id'),
        tombolaId: mapValueOfType<int>(json, r'tombola_id'),
        userId: mapValueOfType<int>(json, r'user_id'),
        winner: mapValueOfType<bool>(json, r'winner'),
      );
    }
    return null;
  }

  static List<ModelsTicket> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsTicket>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsTicket.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsTicket> mapFromJson(dynamic json) {
    final map = <String, ModelsTicket>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsTicket.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsTicket-objects as value to a dart map
  static Map<String, List<ModelsTicket>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsTicket>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsTicket.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

