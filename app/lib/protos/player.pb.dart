///
//  Generated code. Do not modify.
//  source: player.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $1;

class RegisterExternalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterExternalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName', protoName: 'fullName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  RegisterExternalRequest._() : super();
  factory RegisterExternalRequest({
    $core.String? fullName,
    $core.String? nickname,
    $core.String? email,
  }) {
    final _result = create();
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory RegisterExternalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterExternalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterExternalRequest clone() => RegisterExternalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterExternalRequest copyWith(void Function(RegisterExternalRequest) updates) => super.copyWith((message) => updates(message as RegisterExternalRequest)) as RegisterExternalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterExternalRequest create() => RegisterExternalRequest._();
  RegisterExternalRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterExternalRequest> createRepeated() => $pb.PbList<RegisterExternalRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterExternalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterExternalRequest>(create);
  static RegisterExternalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fullName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fullName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFullName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFullName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class RegisterExternalReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterExternalReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerModel', protoName: 'playerModel', subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false
  ;

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
  factory RegisterExternalReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterExternalReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterExternalReply clone() => RegisterExternalReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterExternalReply copyWith(void Function(RegisterExternalReply) updates) => super.copyWith((message) => updates(message as RegisterExternalReply)) as RegisterExternalReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterExternalReply create() => RegisterExternalReply._();
  RegisterExternalReply createEmptyInstance() => create();
  static $pb.PbList<RegisterExternalReply> createRepeated() => $pb.PbList<RegisterExternalReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterExternalReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterExternalReply>(create);
  static RegisterExternalReply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlayerModel get playerModel => $_getN(0);
  @$pb.TagNumber(1)
  set playerModel($1.PlayerModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerModel() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlayerModel ensurePlayerModel() => $_ensure(0);
}

class GetPlayersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlayersRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetPlayersRequest._() : super();
  factory GetPlayersRequest() => create();
  factory GetPlayersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayersRequest clone() => GetPlayersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayersRequest copyWith(void Function(GetPlayersRequest) updates) => super.copyWith((message) => updates(message as GetPlayersRequest)) as GetPlayersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayersRequest create() => GetPlayersRequest._();
  GetPlayersRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlayersRequest> createRepeated() => $pb.PbList<GetPlayersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlayersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayersRequest>(create);
  static GetPlayersRequest? _defaultInstance;
}

class GetPlayersReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlayersReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..pc<$1.PlayerModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerModel', $pb.PbFieldType.PM, protoName: 'playerModel', subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false
  ;

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
  factory GetPlayersReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayersReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayersReply clone() => GetPlayersReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayersReply copyWith(void Function(GetPlayersReply) updates) => super.copyWith((message) => updates(message as GetPlayersReply)) as GetPlayersReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayersReply create() => GetPlayersReply._();
  GetPlayersReply createEmptyInstance() => create();
  static $pb.PbList<GetPlayersReply> createRepeated() => $pb.PbList<GetPlayersReply>();
  @$core.pragma('dart2js:noInline')
  static GetPlayersReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayersReply>(create);
  static GetPlayersReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PlayerModel> get playerModel => $_getList(0);
}

class SyncAzureAdToDbRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncAzureAdToDbRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SyncAzureAdToDbRequest._() : super();
  factory SyncAzureAdToDbRequest() => create();
  factory SyncAzureAdToDbRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncAzureAdToDbRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncAzureAdToDbRequest clone() => SyncAzureAdToDbRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncAzureAdToDbRequest copyWith(void Function(SyncAzureAdToDbRequest) updates) => super.copyWith((message) => updates(message as SyncAzureAdToDbRequest)) as SyncAzureAdToDbRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncAzureAdToDbRequest create() => SyncAzureAdToDbRequest._();
  SyncAzureAdToDbRequest createEmptyInstance() => create();
  static $pb.PbList<SyncAzureAdToDbRequest> createRepeated() => $pb.PbList<SyncAzureAdToDbRequest>();
  @$core.pragma('dart2js:noInline')
  static SyncAzureAdToDbRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncAzureAdToDbRequest>(create);
  static SyncAzureAdToDbRequest? _defaultInstance;
}

class SyncAzureAdToDbReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncAzureAdToDbReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  SyncAzureAdToDbReply._() : super();
  factory SyncAzureAdToDbReply({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory SyncAzureAdToDbReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncAzureAdToDbReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncAzureAdToDbReply clone() => SyncAzureAdToDbReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncAzureAdToDbReply copyWith(void Function(SyncAzureAdToDbReply) updates) => super.copyWith((message) => updates(message as SyncAzureAdToDbReply)) as SyncAzureAdToDbReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncAzureAdToDbReply create() => SyncAzureAdToDbReply._();
  SyncAzureAdToDbReply createEmptyInstance() => create();
  static $pb.PbList<SyncAzureAdToDbReply> createRepeated() => $pb.PbList<SyncAzureAdToDbReply>();
  @$core.pragma('dart2js:noInline')
  static SyncAzureAdToDbReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncAzureAdToDbReply>(create);
  static SyncAzureAdToDbReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetPlayerByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlayerByIdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', protoName: 'playerId')
    ..hasRequiredFields = false
  ;

  GetPlayerByIdRequest._() : super();
  factory GetPlayerByIdRequest({
    $core.String? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory GetPlayerByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayerByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayerByIdRequest clone() => GetPlayerByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayerByIdRequest copyWith(void Function(GetPlayerByIdRequest) updates) => super.copyWith((message) => updates(message as GetPlayerByIdRequest)) as GetPlayerByIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayerByIdRequest create() => GetPlayerByIdRequest._();
  GetPlayerByIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlayerByIdRequest> createRepeated() => $pb.PbList<GetPlayerByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayerByIdRequest>(create);
  static GetPlayerByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class GetPlayerByIdReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlayerByIdReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerModel', protoName: 'playerModel', subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false
  ;

  GetPlayerByIdReply._() : super();
  factory GetPlayerByIdReply({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory GetPlayerByIdReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayerByIdReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayerByIdReply clone() => GetPlayerByIdReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayerByIdReply copyWith(void Function(GetPlayerByIdReply) updates) => super.copyWith((message) => updates(message as GetPlayerByIdReply)) as GetPlayerByIdReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlayerByIdReply create() => GetPlayerByIdReply._();
  GetPlayerByIdReply createEmptyInstance() => create();
  static $pb.PbList<GetPlayerByIdReply> createRepeated() => $pb.PbList<GetPlayerByIdReply>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerByIdReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayerByIdReply>(create);
  static GetPlayerByIdReply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlayerModel get playerModel => $_getN(0);
  @$pb.TagNumber(1)
  set playerModel($1.PlayerModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerModel() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlayerModel ensurePlayerModel() => $_ensure(0);
}

class UpdatePlayerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlayerRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerModel', protoName: 'playerModel', subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false
  ;

  UpdatePlayerRequest._() : super();
  factory UpdatePlayerRequest({
    $1.PlayerModel? playerModel,
  }) {
    final _result = create();
    if (playerModel != null) {
      _result.playerModel = playerModel;
    }
    return _result;
  }
  factory UpdatePlayerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlayerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlayerRequest clone() => UpdatePlayerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlayerRequest copyWith(void Function(UpdatePlayerRequest) updates) => super.copyWith((message) => updates(message as UpdatePlayerRequest)) as UpdatePlayerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerRequest create() => UpdatePlayerRequest._();
  UpdatePlayerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlayerRequest> createRepeated() => $pb.PbList<UpdatePlayerRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlayerRequest>(create);
  static UpdatePlayerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlayerModel get playerModel => $_getN(0);
  @$pb.TagNumber(1)
  set playerModel($1.PlayerModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerModel() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlayerModel ensurePlayerModel() => $_ensure(0);
}

class UpdatePlayerReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlayerReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'player'), createEmptyInstance: create)
    ..aOM<$1.PlayerModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerModel', protoName: 'playerModel', subBuilder: $1.PlayerModel.create)
    ..hasRequiredFields = false
  ;

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
  factory UpdatePlayerReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlayerReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlayerReply clone() => UpdatePlayerReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlayerReply copyWith(void Function(UpdatePlayerReply) updates) => super.copyWith((message) => updates(message as UpdatePlayerReply)) as UpdatePlayerReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerReply create() => UpdatePlayerReply._();
  UpdatePlayerReply createEmptyInstance() => create();
  static $pb.PbList<UpdatePlayerReply> createRepeated() => $pb.PbList<UpdatePlayerReply>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlayerReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlayerReply>(create);
  static UpdatePlayerReply? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PlayerModel get playerModel => $_getN(0);
  @$pb.TagNumber(1)
  set playerModel($1.PlayerModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerModel() => clearField(1);
  @$pb.TagNumber(1)
  $1.PlayerModel ensurePlayerModel() => $_ensure(0);
}

