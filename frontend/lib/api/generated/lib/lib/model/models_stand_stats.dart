//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsStandStats {
  /// Returns a new [ModelsStandStats] instance.
  ModelsStandStats({
    this.createdAt,
    this.id,
    this.itemsSold,
    this.revenue,
    this.standId,
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
  int? itemsSold;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? revenue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? standId;

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
  bool operator ==(Object other) => identical(this, other) || other is ModelsStandStats &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.itemsSold == itemsSold &&
    other.revenue == revenue &&
    other.standId == standId &&
    other.totalTokensUsed == totalTokensUsed &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (itemsSold == null ? 0 : itemsSold!.hashCode) +
    (revenue == null ? 0 : revenue!.hashCode) +
    (standId == null ? 0 : standId!.hashCode) +
    (totalTokensUsed == null ? 0 : totalTokensUsed!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ModelsStandStats[createdAt=$createdAt, id=$id, itemsSold=$itemsSold, revenue=$revenue, standId=$standId, totalTokensUsed=$totalTokensUsed, updatedAt=$updatedAt]';

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
    if (this.itemsSold != null) {
      json[r'items_sold'] = this.itemsSold;
    } else {
      json[r'items_sold'] = null;
    }
    if (this.revenue != null) {
      json[r'revenue'] = this.revenue;
    } else {
      json[r'revenue'] = null;
    }
    if (this.standId != null) {
      json[r'stand_id'] = this.standId;
    } else {
      json[r'stand_id'] = null;
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

  /// Returns a new [ModelsStandStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsStandStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsStandStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsStandStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsStandStats(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        id: mapValueOfType<int>(json, r'id'),
        itemsSold: mapValueOfType<int>(json, r'items_sold'),
        revenue: num.parse('${json[r'revenue']}'),
        standId: mapValueOfType<int>(json, r'stand_id'),
        totalTokensUsed: mapValueOfType<int>(json, r'total_tokens_used'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ModelsStandStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsStandStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsStandStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsStandStats> mapFromJson(dynamic json) {
    final map = <String, ModelsStandStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsStandStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsStandStats-objects as value to a dart map
  static Map<String, List<ModelsStandStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsStandStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsStandStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

