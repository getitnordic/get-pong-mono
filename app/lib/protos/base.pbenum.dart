///
//  Generated code. Do not modify.
//  source: base.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class StreakEnum extends $pb.ProtobufEnum {
  static const StreakEnum NONE = StreakEnum._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const StreakEnum WIN = StreakEnum._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIN');
  static const StreakEnum LOSS = StreakEnum._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOSS');

  static const $core.List<StreakEnum> values = <StreakEnum> [
    NONE,
    WIN,
    LOSS,
  ];

  static final $core.Map<$core.int, StreakEnum> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StreakEnum? valueOf($core.int value) => _byValue[value];

  const StreakEnum._($core.int v, $core.String n) : super(v, n);
}

