///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getGamesRequestDescriptor instead')
const GetGamesRequest$json = const {
  '1': 'GetGamesRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetGamesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesRequestDescriptor = $convert.base64Decode('Cg9HZXRHYW1lc1JlcXVlc3QSFAoFbGltaXQYASABKAVSBWxpbWl0EhYKBm9mZnNldBgCIAEoBVIGb2Zmc2V0');
@$core.Deprecated('Use getGamesReplyDescriptor instead')
const GetGamesReply$json = const {
  '1': 'GetGamesReply',
  '2': const [
    const {'1': 'gameModel', '3': 1, '4': 3, '5': 11, '6': '.game.GameModel', '10': 'gameModel'},
  ],
};

/// Descriptor for `GetGamesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesReplyDescriptor = $convert.base64Decode('Cg1HZXRHYW1lc1JlcGx5Ei0KCWdhbWVNb2RlbBgBIAMoCzIPLmdhbWUuR2FtZU1vZGVsUglnYW1lTW9kZWw=');
@$core.Deprecated('Use getGamesByPlayerIdRequestDescriptor instead')
const GetGamesByPlayerIdRequest$json = const {
  '1': 'GetGamesByPlayerIdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetGamesByPlayerIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesByPlayerIdRequestDescriptor = $convert.base64Decode('ChlHZXRHYW1lc0J5UGxheWVySWRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use getGamesByPlayerIdReplyDescriptor instead')
const GetGamesByPlayerIdReply$json = const {
  '1': 'GetGamesByPlayerIdReply',
  '2': const [
    const {'1': 'gameModel', '3': 1, '4': 3, '5': 11, '6': '.game.GameModel', '10': 'gameModel'},
  ],
};

/// Descriptor for `GetGamesByPlayerIdReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesByPlayerIdReplyDescriptor = $convert.base64Decode('ChdHZXRHYW1lc0J5UGxheWVySWRSZXBseRItCglnYW1lTW9kZWwYASADKAsyDy5nYW1lLkdhbWVNb2RlbFIJZ2FtZU1vZGVs');
@$core.Deprecated('Use getWinProbabilityRequestDescriptor instead')
const GetWinProbabilityRequest$json = const {
  '1': 'GetWinProbabilityRequest',
  '2': const [
    const {'1': 'homeTeamElo', '3': 1, '4': 1, '5': 5, '10': 'homeTeamElo'},
    const {'1': 'awayTeamElo', '3': 2, '4': 1, '5': 5, '10': 'awayTeamElo'},
  ],
};

/// Descriptor for `GetWinProbabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWinProbabilityRequestDescriptor = $convert.base64Decode('ChhHZXRXaW5Qcm9iYWJpbGl0eVJlcXVlc3QSIAoLaG9tZVRlYW1FbG8YASABKAVSC2hvbWVUZWFtRWxvEiAKC2F3YXlUZWFtRWxvGAIgASgFUgthd2F5VGVhbUVsbw==');
@$core.Deprecated('Use getWinProbabilityReplyDescriptor instead')
const GetWinProbabilityReply$json = const {
  '1': 'GetWinProbabilityReply',
  '2': const [
    const {'1': 'winProbability', '3': 1, '4': 1, '5': 1, '10': 'winProbability'},
  ],
};

/// Descriptor for `GetWinProbabilityReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWinProbabilityReplyDescriptor = $convert.base64Decode('ChZHZXRXaW5Qcm9iYWJpbGl0eVJlcGx5EiYKDndpblByb2JhYmlsaXR5GAEgASgBUg53aW5Qcm9iYWJpbGl0eQ==');
@$core.Deprecated('Use saveGameRequestDescriptor instead')
const SaveGameRequest$json = const {
  '1': 'SaveGameRequest',
  '2': const [
    const {'1': 'gameModel', '3': 1, '4': 1, '5': 11, '6': '.game.GameModel', '10': 'gameModel'},
  ],
};

/// Descriptor for `SaveGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveGameRequestDescriptor = $convert.base64Decode('Cg9TYXZlR2FtZVJlcXVlc3QSLQoJZ2FtZU1vZGVsGAEgASgLMg8uZ2FtZS5HYW1lTW9kZWxSCWdhbWVNb2RlbA==');
@$core.Deprecated('Use saveGameReplyDescriptor instead')
const SaveGameReply$json = const {
  '1': 'SaveGameReply',
  '2': const [
    const {'1': 'gameModel', '3': 1, '4': 1, '5': 11, '6': '.game.GameModel', '10': 'gameModel'},
  ],
};

/// Descriptor for `SaveGameReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveGameReplyDescriptor = $convert.base64Decode('Cg1TYXZlR2FtZVJlcGx5Ei0KCWdhbWVNb2RlbBgBIAEoCzIPLmdhbWUuR2FtZU1vZGVsUglnYW1lTW9kZWw=');
@$core.Deprecated('Use gameModelDescriptor instead')
const GameModel$json = const {
  '1': 'GameModel',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'timeStamp', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timeStamp'},
    const {'1': 'homeTeamIds', '3': 3, '4': 3, '5': 9, '10': 'homeTeamIds'},
    const {'1': 'awayTeamIds', '3': 4, '4': 3, '5': 9, '10': 'awayTeamIds'},
    const {'1': 'sets', '3': 5, '4': 3, '5': 11, '6': '.base.SetModel', '10': 'sets'},
  ],
};

/// Descriptor for `GameModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameModelDescriptor = $convert.base64Decode('CglHYW1lTW9kZWwSDgoCaWQYASABKAlSAmlkEjgKCXRpbWVTdGFtcBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVTdGFtcBIgCgtob21lVGVhbUlkcxgDIAMoCVILaG9tZVRlYW1JZHMSIAoLYXdheVRlYW1JZHMYBCADKAlSC2F3YXlUZWFtSWRzEiIKBHNldHMYBSADKAsyDi5iYXNlLlNldE1vZGVsUgRzZXRz');
