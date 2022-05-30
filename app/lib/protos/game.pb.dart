///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $1;

class GetGamesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetGamesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetGamesRequest._() : super();
  factory GetGamesRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final _result = create();
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory GetGamesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGamesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGamesRequest clone() => GetGamesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGamesRequest copyWith(void Function(GetGamesRequest) updates) => super.copyWith((message) => updates(message as GetGamesRequest)) as GetGamesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGamesRequest create() => GetGamesRequest._();
  GetGamesRequest createEmptyInstance() => create();
  static $pb.PbList<GetGamesRequest> createRepeated() => $pb.PbList<GetGamesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGamesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGamesRequest>(create);
  static GetGamesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

class GetGamesReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetGamesReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game'), createEmptyInstance: create)
    ..pc<GameModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameModel', $pb.PbFieldType.PM, protoName: 'gameModel', subBuilder: GameModel.create)
    ..hasRequiredFields = false
  ;

  GetGamesReply._() : super();
  factory GetGamesReply({
    $core.Iterable<GameModel>? gameModel,
  }) {
    final _result = create();
    if (gameModel != null) {
      _result.gameModel.addAll(gameModel);
    }
    return _result;
  }
  factory GetGamesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGamesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGamesReply clone() => GetGamesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGamesReply copyWith(void Function(GetGamesReply) updates) => super.copyWith((message) => updates(message as GetGamesReply)) as GetGamesReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGamesReply create() => GetGamesReply._();
  GetGamesReply createEmptyInstance() => create();
  static $pb.PbList<GetGamesReply> createRepeated() => $pb.PbList<GetGamesReply>();
  @$core.pragma('dart2js:noInline')
  static GetGamesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGamesReply>(create);
  static GetGamesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GameModel> get gameModel => $_getList(0);
}

class SaveGameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveGameRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game'), createEmptyInstance: create)
    ..aOM<GameModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameModel', protoName: 'gameModel', subBuilder: GameModel.create)
    ..hasRequiredFields = false
  ;

  SaveGameRequest._() : super();
  factory SaveGameRequest({
    GameModel? gameModel,
  }) {
    final _result = create();
    if (gameModel != null) {
      _result.gameModel = gameModel;
    }
    return _result;
  }
  factory SaveGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveGameRequest clone() => SaveGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveGameRequest copyWith(void Function(SaveGameRequest) updates) => super.copyWith((message) => updates(message as SaveGameRequest)) as SaveGameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveGameRequest create() => SaveGameRequest._();
  SaveGameRequest createEmptyInstance() => create();
  static $pb.PbList<SaveGameRequest> createRepeated() => $pb.PbList<SaveGameRequest>();
  @$core.pragma('dart2js:noInline')
  static SaveGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveGameRequest>(create);
  static SaveGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  GameModel get gameModel => $_getN(0);
  @$pb.TagNumber(1)
  set gameModel(GameModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameModel() => clearField(1);
  @$pb.TagNumber(1)
  GameModel ensureGameModel() => $_ensure(0);
}

class SaveGameReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveGameReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SaveGameReply._() : super();
  factory SaveGameReply() => create();
  factory SaveGameReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveGameReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveGameReply clone() => SaveGameReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveGameReply copyWith(void Function(SaveGameReply) updates) => super.copyWith((message) => updates(message as SaveGameReply)) as SaveGameReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveGameReply create() => SaveGameReply._();
  SaveGameReply createEmptyInstance() => create();
  static $pb.PbList<SaveGameReply> createRepeated() => $pb.PbList<SaveGameReply>();
  @$core.pragma('dart2js:noInline')
  static SaveGameReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveGameReply>(create);
  static SaveGameReply? _defaultInstance;
}

class GameModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeStamp', protoName: 'timeStamp')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeTeamIds', $pb.PbFieldType.P3, protoName: 'homeTeamIds')
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'awayTeamIds', $pb.PbFieldType.P3, protoName: 'awayTeamIds')
    ..pc<$1.SetModel>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sets', $pb.PbFieldType.PM, subBuilder: $1.SetModel.create)
    ..hasRequiredFields = false
  ;

  GameModel._() : super();
  factory GameModel({
    $fixnum.Int64? timeStamp,
    $core.Iterable<$core.int>? homeTeamIds,
    $core.Iterable<$core.int>? awayTeamIds,
    $core.Iterable<$1.SetModel>? sets,
  }) {
    final _result = create();
    if (timeStamp != null) {
      _result.timeStamp = timeStamp;
    }
    if (homeTeamIds != null) {
      _result.homeTeamIds.addAll(homeTeamIds);
    }
    if (awayTeamIds != null) {
      _result.awayTeamIds.addAll(awayTeamIds);
    }
    if (sets != null) {
      _result.sets.addAll(sets);
    }
    return _result;
  }
  factory GameModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameModel clone() => GameModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameModel copyWith(void Function(GameModel) updates) => super.copyWith((message) => updates(message as GameModel)) as GameModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameModel create() => GameModel._();
  GameModel createEmptyInstance() => create();
  static $pb.PbList<GameModel> createRepeated() => $pb.PbList<GameModel>();
  @$core.pragma('dart2js:noInline')
  static GameModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameModel>(create);
  static GameModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timeStamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timeStamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimeStamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeStamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get homeTeamIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get awayTeamIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$1.SetModel> get sets => $_getList(3);
}

