///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $1;

class GetLeaderboardRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLeaderboardRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leaderboard'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GetLeaderboardRequest._() : super();
  factory GetLeaderboardRequest() => create();
  factory GetLeaderboardRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLeaderboardRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLeaderboardRequest clone() =>
      GetLeaderboardRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLeaderboardRequest copyWith(
          void Function(GetLeaderboardRequest) updates) =>
      super.copyWith((message) => updates(message as GetLeaderboardRequest))
          as GetLeaderboardRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardRequest create() => GetLeaderboardRequest._();
  GetLeaderboardRequest createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardRequest> createRepeated() =>
      $pb.PbList<GetLeaderboardRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardRequest>(create);
  static GetLeaderboardRequest? _defaultInstance;
}

class GetLeaderboardReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLeaderboardReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leaderboard'),
      createEmptyInstance: create)
    ..pc<$1.PlayerModel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        $pb.PbFieldType.PM,
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  GetLeaderboardReply._() : super();
  factory GetLeaderboardReply({
    $core.Iterable<$1.PlayerModel>? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel.addAll(playerModel);
    }
    return _result;
  }
  factory GetLeaderboardReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLeaderboardReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLeaderboardReply clone() => GetLeaderboardReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLeaderboardReply copyWith(void Function(GetLeaderboardReply) updates) =>
      super.copyWith((message) => updates(message as GetLeaderboardReply))
          as GetLeaderboardReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardReply create() => GetLeaderboardReply._();
  GetLeaderboardReply createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardReply> createRepeated() =>
      $pb.PbList<GetLeaderboardReply>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardReply>(create);
  static GetLeaderboardReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PlayerModel> get playerModel => $_getList(0);
}

class GetLeaderboardModelByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLeaderboardModelByIdRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leaderboard'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerId',
        $pb.PbFieldType.O3,
        protoName: 'playerId')
    ..hasRequiredFields = false;

  GetLeaderboardModelByIdRequest._() : super();
  factory GetLeaderboardModelByIdRequest({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory GetLeaderboardModelByIdRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLeaderboardModelByIdRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLeaderboardModelByIdRequest clone() =>
      GetLeaderboardModelByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLeaderboardModelByIdRequest copyWith(
          void Function(GetLeaderboardModelByIdRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetLeaderboardModelByIdRequest))
          as GetLeaderboardModelByIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardModelByIdRequest create() =>
      GetLeaderboardModelByIdRequest._();
  GetLeaderboardModelByIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardModelByIdRequest> createRepeated() =>
      $pb.PbList<GetLeaderboardModelByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardModelByIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardModelByIdRequest>(create);
  static GetLeaderboardModelByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class GetLeaderboardModelByIdReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLeaderboardModelByIdReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leaderboard'),
      createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  GetLeaderboardModelByIdReply._() : super();
  factory GetLeaderboardModelByIdReply({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory GetLeaderboardModelByIdReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLeaderboardModelByIdReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLeaderboardModelByIdReply clone() =>
      GetLeaderboardModelByIdReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLeaderboardModelByIdReply copyWith(
          void Function(GetLeaderboardModelByIdReply) updates) =>
      super.copyWith(
              (message) => updates(message as GetLeaderboardModelByIdReply))
          as GetLeaderboardModelByIdReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardModelByIdReply create() =>
      GetLeaderboardModelByIdReply._();
  GetLeaderboardModelByIdReply createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardModelByIdReply> createRepeated() =>
      $pb.PbList<GetLeaderboardModelByIdReply>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardModelByIdReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardModelByIdReply>(create);
  static GetLeaderboardModelByIdReply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlayerModel get playerModel => $_getN(0);
  @$pb.TagNumber(1)
  set playerModel($1.PlayerModel v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerModel() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlayerModel ensurePlayerModel() => $_ensure(0);
}
