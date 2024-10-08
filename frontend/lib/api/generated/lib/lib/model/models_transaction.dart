//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ModelsTransaction {
  /// Returns a new [ModelsTransaction] instance.
  ModelsTransaction({
    this.amount,
    this.currency,
    this.id,
    this.kermesseID,
    this.paymentIntent,
    this.stand,
    this.standID,
    this.status,
    this.timestamp,
    this.user,
    this.userID,
  });

  /// Nombre de jetons utilisés
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currency;

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
  int? kermesseID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? paymentIntent;

  /// Associations
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ModelsStand? stand;

  /// Référence vers le stand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? standID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timestamp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ModelsUser? user;

  /// Référence vers l'utilisateur
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userID;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ModelsTransaction &&
    other.amount == amount &&
    other.currency == currency &&
    other.id == id &&
    other.kermesseID == kermesseID &&
    other.paymentIntent == paymentIntent &&
    other.stand == stand &&
    other.standID == standID &&
    other.status == status &&
    other.timestamp == timestamp &&
    other.user == user &&
    other.userID == userID;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (currency == null ? 0 : currency!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (kermesseID == null ? 0 : kermesseID!.hashCode) +
    (paymentIntent == null ? 0 : paymentIntent!.hashCode) +
    (stand == null ? 0 : stand!.hashCode) +
    (standID == null ? 0 : standID!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (userID == null ? 0 : userID!.hashCode);

  @override
  String toString() => 'ModelsTransaction[amount=$amount, currency=$currency, id=$id, kermesseID=$kermesseID, paymentIntent=$paymentIntent, stand=$stand, standID=$standID, status=$status, timestamp=$timestamp, user=$user, userID=$userID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.currency != null) {
      json[r'currency'] = this.currency;
    } else {
      json[r'currency'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.kermesseID != null) {
      json[r'kermesseID'] = this.kermesseID;
    } else {
      json[r'kermesseID'] = null;
    }
    if (this.paymentIntent != null) {
      json[r'paymentIntent'] = this.paymentIntent;
    } else {
      json[r'paymentIntent'] = null;
    }
    if (this.stand != null) {
      json[r'stand'] = this.stand;
    } else {
      json[r'stand'] = null;
    }
    if (this.standID != null) {
      json[r'standID'] = this.standID;
    } else {
      json[r'standID'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.timestamp != null) {
      json[r'timestamp'] = this.timestamp;
    } else {
      json[r'timestamp'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.userID != null) {
      json[r'userID'] = this.userID;
    } else {
      json[r'userID'] = null;
    }
    return json;
  }

  /// Returns a new [ModelsTransaction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ModelsTransaction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ModelsTransaction[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ModelsTransaction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ModelsTransaction(
        amount: mapValueOfType<int>(json, r'amount'),
        currency: mapValueOfType<String>(json, r'currency'),
        id: mapValueOfType<int>(json, r'id'),
        kermesseID: mapValueOfType<int>(json, r'kermesseID'),
        paymentIntent: mapValueOfType<String>(json, r'paymentIntent'),
        stand: ModelsStand.fromJson(json[r'stand']),
        standID: mapValueOfType<int>(json, r'standID'),
        status: mapValueOfType<String>(json, r'status'),
        timestamp: mapValueOfType<String>(json, r'timestamp'),
        user: ModelsUser.fromJson(json[r'user']),
        userID: mapValueOfType<int>(json, r'userID'),
      );
    }
    return null;
  }

  static List<ModelsTransaction> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ModelsTransaction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModelsTransaction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ModelsTransaction> mapFromJson(dynamic json) {
    final map = <String, ModelsTransaction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ModelsTransaction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ModelsTransaction-objects as value to a dart map
  static Map<String, List<ModelsTransaction>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ModelsTransaction>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ModelsTransaction.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

