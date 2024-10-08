//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsLot {
  /// Returns a new [ModelsLot] instance.
  ModelsLot({
    this.id,
    this.name,
    this.quantity,
    this.tombolaId,
    this.userWonLots = const [],
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
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? quantity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? tombolaId;

  List<ModelsUserWonLot> userWonLots;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsLot &&
    other.id == id &&
    other.name == name &&
    other.quantity == quantity &&
    other.tombolaId == tombolaId &&
    _deepEquality.equals(other.userWonLots, userWonLots);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (tombolaId == null ? 0 : tombolaId!.hashCode) +
    (userWonLots.hashCode);

  @override
  String toString() => 'ModelsLot[id=$id, name=$name, quantity=$quantity, tombolaId=$tombolaId, userWonLots=$userWonLots]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.quantity != null) {
      json[r'quantity'] = this.quantity;
    } else {
      json[r'quantity'] = null;
    }
    if (this.tombolaId != null) {
      json[r'tombola_id'] = this.tombolaId;
    } else {
      json[r'tombola_id'] = null;
    }
      json[r'user_won_lots'] = this.userWonLots;
    return json;
  }

  /// Returns a new [ModelsLot] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsLot? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsLot[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsLot[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsLot(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        quantity: mapValueOfType<int>(json, r'quantity'),
        tombolaId: mapValueOfType<int>(json, r'tombola_id'),
        userWonLots: ModelsUserWonLot.listFromJson(json[r'user_won_lots']),
      );
    }
    return null;
  }

  static List<ModelsLot> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsLot>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsLot.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsLot> mapFromJson(dynamic json) {
    final map = <String, ModelsLot>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsLot.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsLot-objects as value to a dart map
  static Map<String, List<ModelsLot>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsLot>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsLot.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

