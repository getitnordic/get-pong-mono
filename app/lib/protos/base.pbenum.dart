///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StreakEnum extends $pb.ProtobufEnum {
  static const StreakEnum NONE = StreakEnum._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NONE');
  static const StreakEnum WIN = StreakEnum._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'WIN');
  static const StreakEnum LOSS = StreakEnum._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LOSS');

  static const $core.List<StreakEnum> values = <StreakEnum>[
    NONE,
    WIN,
    LOSS,
  ];

  static final $core.Map<$core.int, StreakEnum> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static StreakEnum? valueOf($core.int value) => _byValue[value];

  const StreakEnum._($core.int v, $core.String n) : super(v, n);
}
