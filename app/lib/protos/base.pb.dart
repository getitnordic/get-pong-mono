///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pbenum.dart';

export 'base.pbenum.dart';

class PlayerModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlayerModel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'base'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstName',
        protoName: 'firstName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastName',
        protoName: 'lastName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickname')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageUrl',
        protoName: 'imageUrl')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'email')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streak',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loss',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalScore',
        $pb.PbFieldType.O3,
        protoName: 'totalScore')
    ..e<StreakEnum>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streakEnum',
        $pb.PbFieldType.OE,
        protoName: 'streakEnum',
        defaultOrMaker: StreakEnum.NONE,
        valueOf: StreakEnum.valueOf,
        enumValues: StreakEnum.values)
    ..hasRequiredFields = false;

  PlayerModel._() : super();
  factory PlayerModel({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? nickname,
    $core.String? imageUrl,
    $core.String? email,
    $core.int? streak,
    $core.int? win,
    $core.int? loss,
    $core.int? totalScore,
    StreakEnum? streakEnum,
  }) {
    final _result = create();
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
    }
    if (email != null) {
      _result.email = email;
    }
    if (streak != null) {
      _result.streak = streak;
    }
    if (win != null) {
      _result.win = win;
    }
    if (loss != null) {
      _result.loss = loss;
    }
    if (totalScore != null) {
      _result.totalScore = totalScore;
    }
    if (streakEnum != null) {
      _result.streakEnum = streakEnum;
    }
    return _result;
  }
  factory PlayerModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlayerModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlayerModel clone() => PlayerModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlayerModel copyWith(void Function(PlayerModel) updates) =>
      super.copyWith((message) => updates(message as PlayerModel))
          as PlayerModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerModel create() => PlayerModel._();
  PlayerModel createEmptyInstance() => create();
  static $pb.PbList<PlayerModel> createRepeated() => $pb.PbList<PlayerModel>();
  @$core.pragma('dart2js:noInline')
  static PlayerModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayerModel>(create);
  static PlayerModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get imageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set imageUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get streak => $_getIZ(5);
  @$pb.TagNumber(6)
  set streak($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStreak() => $_has(5);
  @$pb.TagNumber(6)
  void clearStreak() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get win => $_getIZ(6);
  @$pb.TagNumber(7)
  set win($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWin() => $_has(6);
  @$pb.TagNumber(7)
  void clearWin() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get loss => $_getIZ(7);
  @$pb.TagNumber(8)
  set loss($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLoss() => $_has(7);
  @$pb.TagNumber(8)
  void clearLoss() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get totalScore => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalScore($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalScore() => clearField(9);

  @$pb.TagNumber(10)
  StreakEnum get streakEnum => $_getN(9);
  @$pb.TagNumber(10)
  set streakEnum(StreakEnum v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasStreakEnum() => $_has(9);
  @$pb.TagNumber(10)
  void clearStreakEnum() => clearField(10);
}

class SetModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetModel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'base'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setNo',
        $pb.PbFieldType.O3,
        protoName: 'setNo')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'homeTeam',
        $pb.PbFieldType.O3,
        protoName: 'homeTeam')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awayTeam',
        $pb.PbFieldType.O3,
        protoName: 'awayTeam')
    ..hasRequiredFields = false;

  SetModel._() : super();
  factory SetModel({
    $core.int? setNo,
    $core.int? homeTeam,
    $core.int? awayTeam,
  }) {
    final _result = create();
    if (setNo != null) {
      _result.setNo = setNo;
    }
    if (homeTeam != null) {
      _result.homeTeam = homeTeam;
    }
    if (awayTeam != null) {
      _result.awayTeam = awayTeam;
    }
    return _result;
  }
  factory SetModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetModel clone() => SetModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetModel copyWith(void Function(SetModel) updates) =>
      super.copyWith((message) => updates(message as SetModel))
          as SetModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetModel create() => SetModel._();
  SetModel createEmptyInstance() => create();
  static $pb.PbList<SetModel> createRepeated() => $pb.PbList<SetModel>();
  @$core.pragma('dart2js:noInline')
  static SetModel getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetModel>(create);
  static SetModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get setNo => $_getIZ(0);
  @$pb.TagNumber(1)
  set setNo($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSetNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetNo() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get homeTeam => $_getIZ(1);
  @$pb.TagNumber(2)
  set homeTeam($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHomeTeam() => $_has(1);
  @$pb.TagNumber(2)
  void clearHomeTeam() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get awayTeam => $_getIZ(2);
  @$pb.TagNumber(3)
  set awayTeam($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAwayTeam() => $_has(2);
  @$pb.TagNumber(3)
  void clearAwayTeam() => clearField(3);
}
