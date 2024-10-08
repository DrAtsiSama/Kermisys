//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsUser {
  /// Returns a new [ModelsUser] instance.
  ModelsUser({
    this.createdAt,
    this.email,
    this.id,
    this.passwordHash,
    this.resetToken,
    this.resetTokenExpiry,
    this.role,
    this.updatedAt,
    this.username,
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
  String? email;

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
  String? passwordHash;

  /// Token de réinitialisation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resetToken;

  /// Expiration du token de réinitialisation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resetTokenExpiry;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsUser &&
    other.createdAt == createdAt &&
    other.email == email &&
    other.id == id &&
    other.passwordHash == passwordHash &&
    other.resetToken == resetToken &&
    other.resetTokenExpiry == resetTokenExpiry &&
    other.role == role &&
    other.updatedAt == updatedAt &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (passwordHash == null ? 0 : passwordHash!.hashCode) +
    (resetToken == null ? 0 : resetToken!.hashCode) +
    (resetTokenExpiry == null ? 0 : resetTokenExpiry!.hashCode) +
    (role == null ? 0 : role!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (username == null ? 0 : username!.hashCode);

  @override
  String toString() => 'ModelsUser[createdAt=$createdAt, email=$email, id=$id, passwordHash=$passwordHash, resetToken=$resetToken, resetTokenExpiry=$resetTokenExpiry, role=$role, updatedAt=$updatedAt, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt;
    } else {
      json[r'createdAt'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.passwordHash != null) {
      json[r'passwordHash'] = this.passwordHash;
    } else {
      json[r'passwordHash'] = null;
    }
    if (this.resetToken != null) {
      json[r'resetToken'] = this.resetToken;
    } else {
      json[r'resetToken'] = null;
    }
    if (this.resetTokenExpiry != null) {
      json[r'resetTokenExpiry'] = this.resetTokenExpiry;
    } else {
      json[r'resetTokenExpiry'] = null;
    }
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updatedAt'] = this.updatedAt;
    } else {
      json[r'updatedAt'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsUser] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsUser? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsUser[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsUser[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsUser(
        createdAt: mapValueOfType<String>(json, r'createdAt'),
        email: mapValueOfType<String>(json, r'email'),
        id: mapValueOfType<int>(json, r'id'),
        passwordHash: mapValueOfType<String>(json, r'passwordHash'),
        resetToken: mapValueOfType<String>(json, r'resetToken'),
        resetTokenExpiry: mapValueOfType<String>(json, r'resetTokenExpiry'),
        role: mapValueOfType<String>(json, r'role'),
        updatedAt: mapValueOfType<String>(json, r'updatedAt'),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<ModelsUser> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsUser>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsUser.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsUser> mapFromJson(dynamic json) {
    final map = <String, ModelsUser>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsUser.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsUser-objects as value to a dart map
  static Map<String, List<ModelsUser>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsUser>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsUser.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

