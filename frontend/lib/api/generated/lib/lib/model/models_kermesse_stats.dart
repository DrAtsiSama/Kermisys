//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsKermesseStats {
  /// Returns a new [ModelsKermesseStats] instance.
  ModelsKermesseStats({
    this.createdAt,
    this.id,
    this.kermesseId,
    this.totalParticipants,
    this.totalRevenue,
    this.totalTokensUsed,
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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalParticipants;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalRevenue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalTokensUsed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsKermesseStats &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.kermesseId == kermesseId &&
    other.totalParticipants == totalParticipants &&
    other.totalRevenue == totalRevenue &&
    other.totalTokensUsed == totalTokensUsed &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (kermesseId == null ? 0 : kermesseId!.hashCode) +
    (totalParticipants == null ? 0 : totalParticipants!.hashCode) +
    (totalRevenue == null ? 0 : totalRevenue!.hashCode) +
    (totalTokensUsed == null ? 0 : totalTokensUsed!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ModelsKermesseStats[createdAt=$createdAt, id=$id, kermesseId=$kermesseId, totalParticipants=$totalParticipants, totalRevenue=$totalRevenue, totalTokensUsed=$totalTokensUsed, updatedAt=$updatedAt]';

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
    if (this.totalParticipants != null) {
      json[r'total_participants'] = this.totalParticipants;
    } else {
      json[r'total_participants'] = null;
    }
    if (this.totalRevenue != null) {
      json[r'total_revenue'] = this.totalRevenue;
    } else {
      json[r'total_revenue'] = null;
    }
    if (this.totalTokensUsed != null) {
      json[r'total_tokens_used'] = this.totalTokensUsed;
    } else {
      json[r'total_tokens_used'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsKermesseStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsKermesseStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsKermesseStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsKermesseStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsKermesseStats(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: mapValueOfType<int>(json, r'id'),
        kermesseId: mapValueOfType<int>(json, r'kermesse_id'),
        totalParticipants: mapValueOfType<int>(json, r'total_participants'),
        totalRevenue: num.parse('${json[r'total_revenue']}'),
        totalTokensUsed: mapValueOfType<int>(json, r'total_tokens_used'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ModelsKermesseStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsKermesseStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsKermesseStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsKermesseStats> mapFromJson(dynamic json) {
    final map = <String, ModelsKermesseStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsKermesseStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsKermesseStats-objects as value to a dart map
  static Map<String, List<ModelsKermesseStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsKermesseStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsKermesseStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

