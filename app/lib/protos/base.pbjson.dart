///
//  Generated code. Do not modify.
//  source: base.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use streakEnumDescriptor instead')
const StreakEnum$json = const {
  '1': 'StreakEnum',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'WIN', '2': 1},
    const {'1': 'LOSS', '2': 2},
  ],
};

/// Descriptor for `StreakEnum`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List streakEnumDescriptor = $convert.base64Decode('CgpTdHJlYWtFbnVtEggKBE5PTkUQABIHCgNXSU4QARIICgRMT1NTEAI=');
@$core.Deprecated('Use playerModelDescriptor instead')
const PlayerModel$json = const {
  '1': 'PlayerModel',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fullName', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'imageUrl', '3': 4, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'streak', '3': 6, '4': 1, '5': 5, '10': 'streak'},
    const {'1': 'win', '3': 7, '4': 1, '5': 5, '10': 'win'},
    const {'1': 'loss', '3': 8, '4': 1, '5': 5, '10': 'loss'},
    const {'1': 'totalScore', '3': 9, '4': 1, '5': 5, '10': 'totalScore'},
    const {'1': 'azureAdId', '3': 10, '4': 1, '5': 9, '10': 'azureAdId'},
    const {'1': 'streakEnum', '3': 11, '4': 1, '5': 14, '6': '.base.StreakEnum', '10': 'streakEnum'},
    const {'1': 'lastActivity', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastActivity'},
  ],
};

/// Descriptor for `PlayerModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerModelDescriptor = $convert.base64Decode('CgtQbGF5ZXJNb2RlbBIOCgJpZBgBIAEoCVICaWQSGgoIZnVsbE5hbWUYAiABKAlSCGZ1bGxOYW1lEhoKCG5pY2tuYW1lGAMgASgJUghuaWNrbmFtZRIaCghpbWFnZVVybBgEIAEoCVIIaW1hZ2VVcmwSFAoFZW1haWwYBSABKAlSBWVtYWlsEhYKBnN0cmVhaxgGIAEoBVIGc3RyZWFrEhAKA3dpbhgHIAEoBVIDd2luEhIKBGxvc3MYCCABKAVSBGxvc3MSHgoKdG90YWxTY29yZRgJIAEoBVIKdG90YWxTY29yZRIcCglhenVyZUFkSWQYCiABKAlSCWF6dXJlQWRJZBIwCgpzdHJlYWtFbnVtGAsgASgOMhAuYmFzZS5TdHJlYWtFbnVtUgpzdHJlYWtFbnVtEj4KDGxhc3RBY3Rpdml0eRgMIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDGxhc3RBY3Rpdml0eQ==');
@$core.Deprecated('Use setModelDescriptor instead')
const SetModel$json = const {
  '1': 'SetModel',
  '2': const [
    const {'1': 'setNo', '3': 1, '4': 1, '5': 5, '10': 'setNo'},
    const {'1': 'homeTeam', '3': 2, '4': 1, '5': 5, '10': 'homeTeam'},
    const {'1': 'awayTeam', '3': 3, '4': 1, '5': 5, '10': 'awayTeam'},
  ],
};

/// Descriptor for `SetModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setModelDescriptor = $convert.base64Decode('CghTZXRNb2RlbBIUCgVzZXRObxgBIAEoBVIFc2V0Tm8SGgoIaG9tZVRlYW0YAiABKAVSCGhvbWVUZWFtEhoKCGF3YXlUZWFtGAMgASgFUghhd2F5VGVhbQ==');
