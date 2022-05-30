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
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `RegisterExternalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerExternalRequestDescriptor = $convert.base64Decode('ChdSZWdpc3RlckV4dGVybmFsUmVxdWVzdBIzCgtwbGF5ZXJNb2RlbBgBIAEoCzIRLmJhc2UuUGxheWVyTW9kZWxSC3BsYXllck1vZGVs');
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
@$core.Deprecated('Use updatePlayerRequestDescriptor instead')
const UpdatePlayerRequest$json = const {
  '1': 'UpdatePlayerRequest',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'playerModel', '3': 2, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `UpdatePlayerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlayerRequestDescriptor = $convert.base64Decode('ChNVcGRhdGVQbGF5ZXJSZXF1ZXN0EhoKCHBsYXllcklkGAEgASgJUghwbGF5ZXJJZBIzCgtwbGF5ZXJNb2RlbBgCIAEoCzIRLmJhc2UuUGxheWVyTW9kZWxSC3BsYXllck1vZGVs');
@$core.Deprecated('Use updatePlayerReplyDescriptor instead')
const UpdatePlayerReply$json = const {
  '1': 'UpdatePlayerReply',
  '2': const [
    const {'1': 'playerModel', '3': 1, '4': 1, '5': 11, '6': '.base.PlayerModel', '10': 'playerModel'},
  ],
};

/// Descriptor for `UpdatePlayerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlayerReplyDescriptor = $convert.base64Decode('ChFVcGRhdGVQbGF5ZXJSZXBseRIzCgtwbGF5ZXJNb2RlbBgBIAEoCzIRLmJhc2UuUGxheWVyTW9kZWxSC3BsYXllck1vZGVs');
