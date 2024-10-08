//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserParentRequestsPostRequest {
  /// Returns a new [UserParentRequestsPostRequest] instance.
  UserParentRequestsPostRequest({
    required this.parentUsername,
    required this.childUsername,
  });

  /// Nom d'utilisateur du parent
  String parentUsername;

  /// Nom d'utilisateur de l'enfant
  String childUsername;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserParentRequestsPostRequest &&
    other.parentUsername == parentUsername &&
    other.childUsername == childUsername;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parentUsername.hashCode) +
    (childUsername.hashCode);

  @override
  String toString() => 'UserParentRequestsPostRequest[parentUsername=$parentUsername, childUsername=$childUsername]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'parent_username'] = this.parentUsername;
      json[r'child_username'] = this.childUsername;
    return json;
  }

  /// Returns a new [UserParentRequestsPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserParentRequestsPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserParentRequestsPostRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserParentRequestsPostRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserParentRequestsPostRequest(
        parentUsername: mapValueOfType<String>(json, r'parent_username')!,
        childUsername: mapValueOfType<String>(json, r'child_username')!,
      );
    }
    return null;
  }

  static List<UserParentRequestsPostRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserParentRequestsPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserParentRequestsPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserParentRequestsPostRequest> mapFromJson(dynamic json) {
    final map = <String, UserParentRequestsPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserParentRequestsPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserParentRequestsPostRequest-objects as value to a dart map
  static Map<String, List<UserParentRequestsPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserParentRequestsPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserParentRequestsPostRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'parent_username',
    'child_username',
  };
}

