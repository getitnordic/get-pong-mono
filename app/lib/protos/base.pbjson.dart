///
//  Generated code. Do not modify.
//  source: base.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

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
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'nickname', '3': 4, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'imageUrl', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'streak', '3': 7, '4': 1, '5': 5, '10': 'streak'},
    const {'1': 'win', '3': 8, '4': 1, '5': 5, '10': 'win'},
    const {'1': 'loss', '3': 9, '4': 1, '5': 5, '10': 'loss'},
    const {'1': 'totalScore', '3': 10, '4': 1, '5': 5, '10': 'totalScore'},
    const {'1': 'streakEnum', '3': 11, '4': 1, '5': 14, '6': '.base.StreakEnum', '10': 'streakEnum'},
  ],
};

/// Descriptor for `PlayerModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerModelDescriptor = $convert.base64Decode('CgtQbGF5ZXJNb2RlbBIOCgJpZBgBIAEoCVICaWQSHAoJZmlyc3ROYW1lGAIgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYAyABKAlSCGxhc3ROYW1lEhoKCG5pY2tuYW1lGAQgASgJUghuaWNrbmFtZRIaCghpbWFnZVVybBgFIAEoCVIIaW1hZ2VVcmwSFAoFZW1haWwYBiABKAlSBWVtYWlsEhYKBnN0cmVhaxgHIAEoBVIGc3RyZWFrEhAKA3dpbhgIIAEoBVIDd2luEhIKBGxvc3MYCSABKAVSBGxvc3MSHgoKdG90YWxTY29yZRgKIAEoBVIKdG90YWxTY29yZRIwCgpzdHJlYWtFbnVtGAsgASgOMhAuYmFzZS5TdHJlYWtFbnVtUgpzdHJlYWtFbnVt');
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
