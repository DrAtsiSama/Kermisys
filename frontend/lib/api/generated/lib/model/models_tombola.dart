//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsTombola {
  /// Returns a new [ModelsTombola] instance.
  ModelsTombola({
    this.createdAt,
    this.id,
    this.kermesseId,
    this.lots = const [],
    this.name,
    this.organisateurs = const [],
    this.tickets = const [],
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

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

  /// Relation avec les lots
  List<ModelsLot> lots;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Relation avec les organisateurs
  List<ModelsUser> organisateurs;

  /// Relation avec les tickets
  List<ModelsTicket> tickets;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsTombola &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.kermesseId == kermesseId &&
    _deepEquality.equals(other.lots, lots) &&
    other.name == name &&
    _deepEquality.equals(other.organisateurs, organisateurs) &&
    _deepEquality.equals(other.tickets, tickets) &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (kermesseId == null ? 0 : kermesseId!.hashCode) +
    (lots.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (organisateurs.hashCode) +
    (tickets.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ModelsTombola[createdAt=$createdAt, id=$id, kermesseId=$kermesseId, lots=$lots, name=$name, organisateurs=$organisateurs, tickets=$tickets, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
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
      json[r'lots'] = this.lots;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'organisateurs'] = this.organisateurs;
      json[r'tickets'] = this.tickets;
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsTombola] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsTombola? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsTombola[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsTombola[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsTombola(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: mapValueOfType<int>(json, r'id'),
        kermesseId: mapValueOfType<int>(json, r'kermesse_id'),
        lots: ModelsLot.listFromJson(json[r'lots']),
        name: mapValueOfType<String>(json, r'name'),
        organisateurs: ModelsUser.listFromJson(json[r'organisateurs']),
        tickets: ModelsTicket.listFromJson(json[r'tickets']),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ModelsTombola> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsTombola>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsTombola.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsTombola> mapFromJson(dynamic json) {
    final map = <String, ModelsTombola>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsTombola.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsTombola-objects as value to a dart map
  static Map<String, List<ModelsTombola>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsTombola>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsTombola.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

