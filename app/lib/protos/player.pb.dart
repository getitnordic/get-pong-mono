///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $1;

class RegisterExternalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RegisterExternalRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
      createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  RegisterExternalRequest._() : super();
  factory RegisterExternalRequest({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory RegisterExternalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RegisterExternalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RegisterExternalRequest clone() =>
      RegisterExternalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RegisterExternalRequest copyWith(
          void Function(RegisterExternalRequest) updates) =>
      super.copyWith((message) => updates(message as RegisterExternalRequest))
          as RegisterExternalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterExternalRequest create() => RegisterExternalRequest._();
  RegisterExternalRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterExternalRequest> createRepeated() =>
      $pb.PbList<RegisterExternalRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterExternalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterExternalRequest>(create);
  static RegisterExternalRequest? _defaultInstance;

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

class RegisterExternalReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RegisterExternalReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
      createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  RegisterExternalReply._() : super();
  factory RegisterExternalReply({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory RegisterExternalReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RegisterExternalReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RegisterExternalReply clone() =>
      RegisterExternalReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RegisterExternalReply copyWith(
          void Function(RegisterExternalReply) updates) =>
      super.copyWith((message) => updates(message as RegisterExternalReply))
          as RegisterExternalReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterExternalReply create() => RegisterExternalReply._();
  RegisterExternalReply createEmptyInstance() => create();
  static $pb.PbList<RegisterExternalReply> createRepeated() =>
      $pb.PbList<RegisterExternalReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterExternalReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterExternalReply>(create);
  static RegisterExternalReply? _defaultInstance;

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

class GetPlayersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPlayersRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GetPlayersRequest._() : super();
  factory GetPlayersRequest() => create();
  factory GetPlayersRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPlayersRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPlayersRequest clone() => GetPlayersRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPlayersRequest copyWith(void Function(GetPlayersRequest) updates) =>
      super.copyWith((message) => updates(message as GetPlayersRequest))
          as GetPlayersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayersRequest create() => GetPlayersRequest._();
  GetPlayersRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlayersRequest> createRepeated() =>
      $pb.PbList<GetPlayersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlayersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPlayersRequest>(create);
  static GetPlayersRequest? _defaultInstance;
}

class GetPlayersReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPlayersReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
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

  GetPlayersReply._() : super();
  factory GetPlayersReply({
    $core.Iterable<$1.PlayerModel>? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel.addAll(playerModel);
    }
    return _result;
  }
  factory GetPlayersReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPlayersReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPlayersReply clone() => GetPlayersReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPlayersReply copyWith(void Function(GetPlayersReply) updates) =>
      super.copyWith((message) => updates(message as GetPlayersReply))
          as GetPlayersReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayersReply create() => GetPlayersReply._();
  GetPlayersReply createEmptyInstance() => create();
  static $pb.PbList<GetPlayersReply> createRepeated() =>
      $pb.PbList<GetPlayersReply>();
  @$core.pragma('dart2js:noInline')
  static GetPlayersReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPlayersReply>(create);
  static GetPlayersReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PlayerModel> get playerModel => $_getList(0);
}

class UpdatePlayerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdatePlayerRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerId',
        protoName: 'playerId')
    ..aOM<$1.PlayerModel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  UpdatePlayerRequest._() : super();
  factory UpdatePlayerRequest({
    $core.String? playerId,
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory UpdatePlayerRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePlayerRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePlayerRequest clone() => UpdatePlayerRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePlayerRequest copyWith(void Function(UpdatePlayerRequest) updates) =>
      super.copyWith((message) => updates(message as UpdatePlayerRequest))
          as UpdatePlayerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerRequest create() => UpdatePlayerRequest._();
  UpdatePlayerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlayerRequest> createRepeated() =>
      $pb.PbList<UpdatePlayerRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePlayerRequest>(create);
  static UpdatePlayerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $1.PlayerModel get playerModel => $_getN(1);
  @$pb.TagNumber(2)
  set playerModel($1.PlayerModel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayerModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerModel() => clearField(2);
  @$pb.TagNumber(2)
  $1.PlayerModel ensurePlayerModel() => $_ensure(1);
}

class UpdatePlayerReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdatePlayerReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'player'),
      createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playerModel',
        protoName: 'playerModel',
        subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false;

  UpdatePlayerReply._() : super();
  factory UpdatePlayerReply({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory UpdatePlayerReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePlayerReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePlayerReply clone() => UpdatePlayerReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePlayerReply copyWith(void Function(UpdatePlayerReply) updates) =>
      super.copyWith((message) => updates(message as UpdatePlayerReply))
          as UpdatePlayerReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerReply create() => UpdatePlayerReply._();
  UpdatePlayerReply createEmptyInstance() => create();
  static $pb.PbList<UpdatePlayerReply> createRepeated() =>
      $pb.PbList<UpdatePlayerReply>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePlayerReply>(create);
  static UpdatePlayerReply? _defaultInstance;

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
