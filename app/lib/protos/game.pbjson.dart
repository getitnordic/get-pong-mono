///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
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
final $typed_data.Uint8List getGamesRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRHYW1lc1JlcXVlc3QSFAoFbGltaXQYASABKAVSBWxpbWl0EhYKBm9mZnNldBgCIAEoBVIGb2Zmc2V0');
@$core.Deprecated('Use getGamesReplyDescriptor instead')
const GetGamesReply$json = const {
  '1': 'GetGamesReply',
  '2': const [
    const {
      '1': 'gameModel',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.game.GameModel',
      '10': 'gameModel'
    },
  ],
};

/// Descriptor for `GetGamesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesReplyDescriptor = $convert.base64Decode(
    'Cg1HZXRHYW1lc1JlcGx5Ei0KCWdhbWVNb2RlbBgBIAMoCzIPLmdhbWUuR2FtZU1vZGVsUglnYW1lTW9kZWw=');
@$core.Deprecated('Use saveGameRequestDescriptor instead')
const SaveGameRequest$json = const {
  '1': 'SaveGameRequest',
  '2': const [
    const {
      '1': 'gameModel',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.game.GameModel',
      '10': 'gameModel'
    },
  ],
};

/// Descriptor for `SaveGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveGameRequestDescriptor = $convert.base64Decode(
    'Cg9TYXZlR2FtZVJlcXVlc3QSLQoJZ2FtZU1vZGVsGAEgASgLMg8uZ2FtZS5HYW1lTW9kZWxSCWdhbWVNb2RlbA==');
@$core.Deprecated('Use saveGameReplyDescriptor instead')
const SaveGameReply$json = const {
  '1': 'SaveGameReply',
};

/// Descriptor for `SaveGameReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveGameReplyDescriptor =
    $convert.base64Decode('Cg1TYXZlR2FtZVJlcGx5');
@$core.Deprecated('Use gameModelDescriptor instead')
const GameModel$json = const {
  '1': 'GameModel',
  '2': const [
    const {'1': 'timeStamp', '3': 1, '4': 1, '5': 3, '10': 'timeStamp'},
    const {'1': 'homeTeamIds', '3': 2, '4': 3, '5': 5, '10': 'homeTeamIds'},
    const {'1': 'awayTeamIds', '3': 3, '4': 3, '5': 5, '10': 'awayTeamIds'},
    const {
      '1': 'sets',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.base.SetModel',
      '10': 'sets'
    },
  ],
};

/// Descriptor for `GameModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameModelDescriptor = $convert.base64Decode(
    'CglHYW1lTW9kZWwSHAoJdGltZVN0YW1wGAEgASgDUgl0aW1lU3RhbXASIAoLaG9tZVRlYW1JZHMYAiADKAVSC2hvbWVUZWFtSWRzEiAKC2F3YXlUZWFtSWRzGAMgAygFUgthd2F5VGVhbUlkcxIiCgRzZXRzGAQgAygLMg4uYmFzZS5TZXRNb2RlbFIEc2V0cw==');
