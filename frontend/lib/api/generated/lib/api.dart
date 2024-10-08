//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/authentification_api.dart';
part 'api/chat_api.dart';
part 'api/jetons_api.dart';
part 'api/kermesses_api.dart';
part 'api/paiements_api.dart';
part 'api/parent_enfant_api.dart';
part 'api/stands_api.dart';
part 'api/statistiques_api.dart';
part 'api/tombolas_api.dart';
part 'api/utilisateurs_api.dart';
part 'api/web_socket_api.dart';

part 'model/controllers_achat_request.dart';
part 'model/controllers_distribute_tokens_request.dart';
part 'model/controllers_token_response.dart';
part 'model/controllers_winner_response.dart';
part 'model/models_buy_tokens_response.dart';
part 'model/models_chat_message.dart';
part 'model/models_create_user_response.dart';
part 'model/models_distribute_tokens_response.dart';
part 'model/models_error_response.dart';
part 'model/models_kermesse.dart';
part 'model/models_kermesse_stats.dart';
part 'model/models_login_response.dart';
part 'model/models_lot.dart';
part 'model/models_message_response.dart';
part 'model/models_organisateur_stats.dart';
part 'model/models_parent_child_request.dart';
part 'model/models_payment_request.dart';
part 'model/models_player_score.dart';
part 'model/models_score_request.dart';
part 'model/models_stand.dart';
part 'model/models_stand_stats.dart';
part 'model/models_ticket.dart';
part 'model/models_tombola.dart';
part 'model/models_transaction.dart';
part 'model/models_user.dart';
part 'model/models_user_response.dart';
part 'model/models_user_won_lot.dart';
part 'model/user_parent_requests_post_request.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
