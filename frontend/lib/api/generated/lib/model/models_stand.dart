//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsStand {
  /// Returns a new [ModelsStand] instance.
  ModelsStand({
    this.createdAt,
    this.description,
    this.endDate,
    this.id,
    this.kermesse,
    this.kermesseId,
    this.location,
    this.name,
    this.owner,
    this.ownerId,
    this.startDate,
    this.stock,
    this.type,
    this.updatedAt,
  });

  /// Date de création du stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  /// Augmenté la taille pour plus de flexibilité
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Date de fin du stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Associations
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ModelsKermesse? kermesse;

  /// Référence vers la Kermesse
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? kermesseId;

  /// Lieu où se trouve le stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? location;

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
  ModelsUser? owner;

  /// Référence vers le User qui tient le stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ownerId;

  /// Date de début du stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? stock;

  /// e.g., \"food\", \"game\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// Date de la dernière mise à jour du stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsStand &&
    other.createdAt == createdAt &&
    other.description == description &&
    other.endDate == endDate &&
    other.id == id &&
    other.kermesse == kermesse &&
    other.kermesseId == kermesseId &&
    other.location == location &&
    other.name == name &&
    other.owner == owner &&
    other.ownerId == ownerId &&
    other.startDate == startDate &&
    other.stock == stock &&
    other.type == type &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (kermesse == null ? 0 : kermesse!.hashCode) +
    (kermesseId == null ? 0 : kermesseId!.hashCode) +
    (location == null ? 0 : location!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (stock == null ? 0 : stock!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ModelsStand[createdAt=$createdAt, description=$description, endDate=$endDate, id=$id, kermesse=$kermesse, kermesseId=$kermesseId, location=$location, name=$name, owner=$owner, ownerId=$ownerId, startDate=$startDate, stock=$stock, type=$type, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.endDate != null) {
      json[r'end_date'] = this.endDate;
    } else {
      json[r'end_date'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.kermesse != null) {
      json[r'kermesse'] = this.kermesse;
    } else {
      json[r'kermesse'] = null;
    }
    if (this.kermesseId != null) {
      json[r'kermesse_id'] = this.kermesseId;
    } else {
      json[r'kermesse_id'] = null;
    }
    if (this.location != null) {
      json[r'location'] = this.location;
    } else {
      json[r'location'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.owner != null) {
      json[r'owner'] = this.owner;
    } else {
      json[r'owner'] = null;
    }
    if (this.ownerId != null) {
      json[r'owner_id'] = this.ownerId;
    } else {
      json[r'owner_id'] = null;
    }
    if (this.startDate != null) {
      json[r'start_date'] = this.startDate;
    } else {
      json[r'start_date'] = null;
    }
    if (this.stock != null) {
      json[r'stock'] = this.stock;
    } else {
      json[r'stock'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsStand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsStand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsStand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsStand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsStand(
        createdAt: mapValueOfType<String>(json, r'created_at'),
        description: mapValueOfType<String>(json, r'description'),
        endDate: mapValueOfType<String>(json, r'end_date'),
        id: mapValueOfType<int>(json, r'id'),
        kermesse: ModelsKermesse.fromJson(json[r'kermesse']),
        kermesseId: mapValueOfType<int>(json, r'kermesse_id'),
        location: mapValueOfType<String>(json, r'location'),
        name: mapValueOfType<String>(json, r'name'),
        owner: ModelsUser.fromJson(json[r'owner']),
        ownerId: mapValueOfType<int>(json, r'owner_id'),
        startDate: mapValueOfType<String>(json, r'start_date'),
        stock: mapValueOfType<int>(json, r'stock'),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapValueOfType<String>(json, r'updated_at'),
      );
    }
    return null;
  }

  static List<ModelsStand> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsStand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsStand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsStand> mapFromJson(dynamic json) {
    final map = <String, ModelsStand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsStand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsStand-objects as value to a dart map
  static Map<String, List<ModelsStand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsStand>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsStand.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

