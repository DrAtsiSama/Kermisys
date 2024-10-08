//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsOrganisateurStats {
  /// Returns a new [ModelsOrganisateurStats] instance.
  ModelsOrganisateurStats({
    this.createdAt,
    this.id,
    this.organisateurId,
    this.totalKermesses,
    this.totalRevenue,
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
  int? organisateurId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalKermesses;

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
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsOrganisateurStats &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.organisateurId == organisateurId &&
    other.totalKermesses == totalKermesses &&
    other.totalRevenue == totalRevenue &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (organisateurId == null ? 0 : organisateurId!.hashCode) +
    (totalKermesses == null ? 0 : totalKermesses!.hashCode) +
    (totalRevenue == null ? 0 : totalRevenue!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ModelsOrganisateurStats[createdAt=$createdAt, id=$id, organisateurId=$organisateurId, totalKermesses=$totalKermesses, totalRevenue=$totalRevenue, updatedAt=$updatedAt]';

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
    if (this.organisateurId != null) {
      json[r'organisateur_id'] = this.organisateurId;
    } else {
      json[r'organisateur_id'] = null;
    }
    if (this.totalKermesses != null) {
      json[r'total_kermesses'] = this.totalKermesses;
    } else {
      json[r'total_kermesses'] = null;
    }
    if (this.totalRevenue != null) {
      json[r'total_revenue'] = this.totalRevenue;
    } else {
      json[r'total_revenue'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsOrganisateurStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsOrganisateurStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsOrganisateurStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsOrganisateurStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsOrganisateurStats(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: mapValueOfType<int>(json, r'id'),
        organisateurId: mapValueOfType<int>(json, r'organisateur_id'),
        totalKermesses: mapValueOfType<int>(json, r'total_kermesses'),
        totalRevenue: num.parse('${json[r'total_revenue']}'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ModelsOrganisateurStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsOrganisateurStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsOrganisateurStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsOrganisateurStats> mapFromJson(dynamic json) {
    final map = <String, ModelsOrganisateurStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsOrganisateurStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsOrganisateurStats-objects as value to a dart map
  static Map<String, List<ModelsOrganisateurStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsOrganisateurStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsOrganisateurStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

