///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
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
final $typed_data.Uint8List streakEnumDescriptor = $convert
    .base64Decode('CgpTdHJlYWtFbnVtEggKBE5PTkUQABIHCgNXSU4QARIICgRMT1NTEAI=');
@$core.Deprecated('Use playerModelDescriptor instead')
const PlayerModel$json = const {
  '1': 'PlayerModel',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'imageUrl', '3': 4, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'streak', '3': 6, '4': 1, '5': 5, '10': 'streak'},
    const {'1': 'win', '3': 7, '4': 1, '5': 5, '10': 'win'},
    const {'1': 'loss', '3': 8, '4': 1, '5': 5, '10': 'loss'},
    const {'1': 'totalScore', '3': 9, '4': 1, '5': 5, '10': 'totalScore'},
    const {
      '1': 'streakEnum',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.base.StreakEnum',
      '10': 'streakEnum'
    },
  ],
};

/// Descriptor for `PlayerModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerModelDescriptor = $convert.base64Decode(
    'CgtQbGF5ZXJNb2RlbBIcCglmaXJzdE5hbWUYASABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgCIAEoCVIIbGFzdE5hbWUSGgoIbmlja25hbWUYAyABKAlSCG5pY2tuYW1lEhoKCGltYWdlVXJsGAQgASgJUghpbWFnZVVybBIUCgVlbWFpbBgFIAEoCVIFZW1haWwSFgoGc3RyZWFrGAYgASgFUgZzdHJlYWsSEAoDd2luGAcgASgFUgN3aW4SEgoEbG9zcxgIIAEoBVIEbG9zcxIeCgp0b3RhbFNjb3JlGAkgASgFUgp0b3RhbFNjb3JlEjAKCnN0cmVha0VudW0YCiABKA4yEC5iYXNlLlN0cmVha0VudW1SCnN0cmVha0VudW0=');
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
final $typed_data.Uint8List setModelDescriptor = $convert.base64Decode(
    'CghTZXRNb2RlbBIUCgVzZXRObxgBIAEoBVIFc2V0Tm8SGgoIaG9tZVRlYW0YAiABKAVSCGhvbWVUZWFtEhoKCGF3YXlUZWFtGAMgASgFUghhd2F5VGVhbQ==');
