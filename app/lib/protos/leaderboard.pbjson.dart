///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getLeaderboardRequestDescriptor instead')
const GetLeaderboardRequest$json = const {
  '1': 'GetLeaderboardRequest',
};

/// Descriptor for `GetLeaderboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardRequestDescriptor =
    $convert.base64Decode('ChVHZXRMZWFkZXJib2FyZFJlcXVlc3Q=');
@$core.Deprecated('Use getLeaderboardReplyDescriptor instead')
const GetLeaderboardReply$json = const {
  '1': 'GetLeaderboardReply',
  '2': const [
    const {
      '1': 'playerModel',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.base.PlayerModel',
      '10': 'playerModel'
    },
  ],
};

/// Descriptor for `GetLeaderboardReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardReplyDescriptor = $convert.base64Decode(
    'ChNHZXRMZWFkZXJib2FyZFJlcGx5EjMKC3BsYXllck1vZGVsGAEgAygLMhEuYmFzZS5QbGF5ZXJNb2RlbFILcGxheWVyTW9kZWw=');
@$core.Deprecated('Use getLeaderboardModelByIdRequestDescriptor instead')
const GetLeaderboardModelByIdRequest$json = const {
  '1': 'GetLeaderboardModelByIdRequest',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
  ],
};

/// Descriptor for `GetLeaderboardModelByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardModelByIdRequestDescriptor =
    $convert.base64Decode(
        'Ch5HZXRMZWFkZXJib2FyZE1vZGVsQnlJZFJlcXVlc3QSGgoIcGxheWVySWQYASABKAVSCHBsYXllcklk');
@$core.Deprecated('Use getLeaderboardModelByIdReplyDescriptor instead')
const GetLeaderboardModelByIdReply$json = const {
  '1': 'GetLeaderboardModelByIdReply',
  '2': const [
    const {
      '1': 'playerModel',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.base.PlayerModel',
      '10': 'playerModel'
    },
  ],
};

/// Descriptor for `GetLeaderboardModelByIdReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardModelByIdReplyDescriptor =
    $convert.base64Decode(
        'ChxHZXRMZWFkZXJib2FyZE1vZGVsQnlJZFJlcGx5EjMKC3BsYXllck1vZGVsGAEgASgLMhEuYmFzZS5QbGF5ZXJNb2RlbFILcGxheWVyTW9kZWw=');
