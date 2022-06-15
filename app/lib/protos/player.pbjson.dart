///
//  Generated code. Do not modify.
//  source: player.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerExternalRequestDescriptor instead')
const RegisterExternalRequest$json = const {
  '1': 'RegisterExternalRequest',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterExternalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerExternalRequestDescriptor = $convert.base64Decode('ChdSZWdpc3RlckV4dGVybmFsUmVxdWVzdBIcCglmaXJzdE5hbWUYASABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgCIAEoCVIIbGFzdE5hbWUSGgoIbmlja25hbWUYAyABKAlSCG5pY2tuYW1lEhQKBWVtYWlsGAQgASgJUgVlbWFpbA==');
@$core.Deprecated('Use registerExternalReplyDescriptor instead')
const RegisterExternalReply$json = const {
  '1': 'RegisterExternalReply',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `RegisterExternalReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerExternalReplyDescriptor = $convert.base64Decode('ChVSZWdpc3RlckV4dGVybmFsUmVwbHkSMwoLcGxheWVyTW9kZWwYASABKAsyES5iYXNlLlBsYXllck1vZGVsUgtwbGF5ZXJNb2RlbA==');
@$core.Deprecated('Use getPlayersRequestDescriptor instead')
const GetPlayersRequest$json = const {
  '1': 'GetPlayersRequest',
};

/// Descriptor for `GetPlayersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayersRequestDescriptor = $convert.base64Decode('ChFHZXRQbGF5ZXJzUmVxdWVzdA==');
@$core.Deprecated('Use getPlayersReplyDescriptor instead')
const GetPlayersReply$json = const {
  '1': 'GetPlayersReply',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 3, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `GetPlayersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayersReplyDescriptor = $convert.base64Decode('Cg9HZXRQbGF5ZXJzUmVwbHkSMwoLcGxheWVyTW9kZWwYASADKAsyES5iYXNlLlBsYXllck1vZGVsUgtwbGF5ZXJNb2RlbA==');
@$core.Deprecated('Use syncAzureAdToDbRequestDescriptor instead')
const SyncAzureAdToDbRequest$json = const {
  '1': 'SyncAzureAdToDbRequest',
};

/// Descriptor for `SyncAzureAdToDbRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncAzureAdToDbRequestDescriptor = $convert.base64Decode('ChZTeW5jQXp1cmVBZFRvRGJSZXF1ZXN0');
@$core.Deprecated('Use syncAzureAdToDbReplyDescriptor instead')
const SyncAzureAdToDbReply$json = const {
  '1': 'SyncAzureAdToDbReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SyncAzureAdToDbReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncAzureAdToDbReplyDescriptor = $convert.base64Decode('ChRTeW5jQXp1cmVBZFRvRGJSZXBseRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use getPlayerByIdRequestDescriptor instead')
const GetPlayerByIdRequest$json = const {
  '1': 'GetPlayerByIdRequest',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `GetPlayerByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerByIdRequestDescriptor = $convert.base64Decode('ChRHZXRQbGF5ZXJCeUlkUmVxdWVzdBIaCghwbGF5ZXJJZBgBIAEoCVIIcGxheWVySWQ=');
@$core.Deprecated('Use getPlayerByIdReplyDescriptor instead')
const GetPlayerByIdReply$json = const {
  '1': 'GetPlayerByIdReply',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `GetPlayerByIdReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerByIdReplyDescriptor = $convert.base64Decode('ChJHZXRQbGF5ZXJCeUlkUmVwbHkSMwoLcGxheWVyTW9kZWwYASABKAsyES5iYXNlLlBsYXllck1vZGVsUgtwbGF5ZXJNb2RlbA==');
@$core.Deprecated('Use updatePlayerRequestDescriptor instead')
const UpdatePlayerRequest$json = const {
  '1': 'UpdatePlayerRequest',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `UpdatePlayerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlayerRequestDescriptor = $convert.base64Decode('ChNVcGRhdGVQbGF5ZXJSZXF1ZXN0EjMKC3BsYXllck1vZGVsGAEgASgLMhEuYmFzZS5QbGF5ZXJNb2RlbFILcGxheWVyTW9kZWw=');
@$core.Deprecated('Use updatePlayerReplyDescriptor instead')
const UpdatePlayerReply$json = const {
  '1': 'UpdatePlayerReply',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `UpdatePlayerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlayerReplyDescriptor = $convert.base64Decode('ChFVcGRhdGVQbGF5ZXJSZXBseRIzCgtwbGF5ZXJNb2RlbBgBIAEoCzIRLmJhc2UuUGxheWVyTW9kZWxSC3BsYXllck1vZGVs');
