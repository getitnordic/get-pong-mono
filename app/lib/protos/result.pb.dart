///
//  Generated code. Do not modify.
//  source: result.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;

class GetResultByGameIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetResultByGameIdRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId', protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  GetResultByGameIdRequest._() : super();
  factory GetResultByGameIdRequest({
    $core.String? gameId,
  }) {
    final _result = create();
    if (gameId != null) {
      _result.gameId = gameId;
    }
    return _result;
  }
  factory GetResultByGameIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResultByGameIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResultByGameIdRequest clone() => GetResultByGameIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResultByGameIdRequest copyWith(void Function(GetResultByGameIdRequest) updates) => super.copyWith((message) => updates(message as GetResultByGameIdRequest)) as GetResultByGameIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetResultByGameIdRequest create() => GetResultByGameIdRequest._();
  GetResultByGameIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetResultByGameIdRequest> createRepeated() => $pb.PbList<GetResultByGameIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetResultByGameIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResultByGameIdRequest>(create);
  static GetResultByGameIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class GetResultByGameIdReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetResultByGameIdReply', createEmptyInstance: create)
    ..pc<ResultModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resultModel', $pb.PbFieldType.PM, protoName: 'resultModel', subBuilder: ResultModel.create)
    ..hasRequiredFields = false
  ;

  GetResultByGameIdReply._() : super();
  factory GetResultByGameIdReply({
    $core.Iterable<ResultModel>? resultModel,
  }) {
    final _result = create();
    if (resultModel != null) {
      _result.resultModel.addAll(resultModel);
    }
    return _result;
  }
  factory GetResultByGameIdReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResultByGameIdReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResultByGameIdReply clone() => GetResultByGameIdReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResultByGameIdReply copyWith(void Function(GetResultByGameIdReply) updates) => super.copyWith((message) => updates(message as GetResultByGameIdReply)) as GetResultByGameIdReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetResultByGameIdReply create() => GetResultByGameIdReply._();
  GetResultByGameIdReply createEmptyInstance() => create();
  static $pb.PbList<GetResultByGameIdReply> createRepeated() => $pb.PbList<GetResultByGameIdReply>();
  @$core.pragma('dart2js:noInline')
  static GetResultByGameIdReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResultByGameIdReply>(create);
  static GetResultByGameIdReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResultModel> get resultModel => $_getList(0);
}

class GetResultsByPlayerIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetResultsByPlayerIdRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', protoName: 'playerId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetResultsByPlayerIdRequest._() : super();
  factory GetResultsByPlayerIdRequest({
    $core.String? playerId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory GetResultsByPlayerIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResultsByPlayerIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResultsByPlayerIdRequest clone() => GetResultsByPlayerIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResultsByPlayerIdRequest copyWith(void Function(GetResultsByPlayerIdRequest) updates) => super.copyWith((message) => updates(message as GetResultsByPlayerIdRequest)) as GetResultsByPlayerIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetResultsByPlayerIdRequest create() => GetResultsByPlayerIdRequest._();
  GetResultsByPlayerIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetResultsByPlayerIdRequest> createRepeated() => $pb.PbList<GetResultsByPlayerIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetResultsByPlayerIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResultsByPlayerIdRequest>(create);
  static GetResultsByPlayerIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class GetResultsByPlayerIdReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetResultsByPlayerIdReply', createEmptyInstance: create)
    ..pc<ResultModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resultModels', $pb.PbFieldType.PM, protoName: 'resultModels', subBuilder: ResultModel.create)
    ..hasRequiredFields = false
  ;

  GetResultsByPlayerIdReply._() : super();
  factory GetResultsByPlayerIdReply({
    $core.Iterable<ResultModel>? resultModels,
  }) {
    final _result = create();
    if (resultModels != null) {
      _result.resultModels.addAll(resultModels);
    }
    return _result;
  }
  factory GetResultsByPlayerIdReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResultsByPlayerIdReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResultsByPlayerIdReply clone() => GetResultsByPlayerIdReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResultsByPlayerIdReply copyWith(void Function(GetResultsByPlayerIdReply) updates) => super.copyWith((message) => updates(message as GetResultsByPlayerIdReply)) as GetResultsByPlayerIdReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetResultsByPlayerIdReply create() => GetResultsByPlayerIdReply._();
  GetResultsByPlayerIdReply createEmptyInstance() => create();
  static $pb.PbList<GetResultsByPlayerIdReply> createRepeated() => $pb.PbList<GetResultsByPlayerIdReply>();
  @$core.pragma('dart2js:noInline')
  static GetResultsByPlayerIdReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResultsByPlayerIdReply>(create);
  static GetResultsByPlayerIdReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResultModel> get resultModels => $_getList(0);
}

class SaveResultRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveResultRequest', createEmptyInstance: create)
    ..aOM<ResultModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resultModel', protoName: 'resultModel', subBuilder: ResultModel.create)
    ..hasRequiredFields = false
  ;

  SaveResultRequest._() : super();
  factory SaveResultRequest({
    ResultModel? resultModel,
  }) {
    final _result = create();
    if (resultModel != null) {
      _result.resultModel = resultModel;
    }
    return _result;
  }
  factory SaveResultRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveResultRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveResultRequest clone() => SaveResultRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveResultRequest copyWith(void Function(SaveResultRequest) updates) => super.copyWith((message) => updates(message as SaveResultRequest)) as SaveResultRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveResultRequest create() => SaveResultRequest._();
  SaveResultRequest createEmptyInstance() => create();
  static $pb.PbList<SaveResultRequest> createRepeated() => $pb.PbList<SaveResultRequest>();
  @$core.pragma('dart2js:noInline')
  static SaveResultRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveResultRequest>(create);
  static SaveResultRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ResultModel get resultModel => $_getN(0);
  @$pb.TagNumber(1)
  set resultModel(ResultModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResultModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearResultModel() => clearField(1);
  @$pb.TagNumber(1)
  ResultModel ensureResultModel() => $_ensure(0);
}

class SaveResultReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveResultReply', createEmptyInstance: create)
    ..aOM<ResultModel>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resultModel', protoName: 'resultModel', subBuilder: ResultModel.create)
    ..hasRequiredFields = false
  ;

  SaveResultReply._() : super();
  factory SaveResultReply({
    ResultModel? resultModel,
  }) {
    final _result = create();
    if (resultModel != null) {
      _result.resultModel = resultModel;
    }
    return _result;
  }
  factory SaveResultReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveResultReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveResultReply clone() => SaveResultReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveResultReply copyWith(void Function(SaveResultReply) updates) => super.copyWith((message) => updates(message as SaveResultReply)) as SaveResultReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveResultReply create() => SaveResultReply._();
  SaveResultReply createEmptyInstance() => create();
  static $pb.PbList<SaveResultReply> createRepeated() => $pb.PbList<SaveResultReply>();
  @$core.pragma('dart2js:noInline')
  static SaveResultReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveResultReply>(create);
  static SaveResultReply? _defaultInstance;

  @$pb.TagNumber(1)
  ResultModel get resultModel => $_getN(0);
  @$pb.TagNumber(1)
  set resultModel(ResultModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResultModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearResultModel() => clearField(1);
  @$pb.TagNumber(1)
  ResultModel ensureResultModel() => $_ensure(0);
}

class ResultModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResultModel', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eloDiff', $pb.PbFieldType.O3, protoName: 'eloDiff')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newElo', $pb.PbFieldType.O3, protoName: 'newElo')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameWon', protoName: 'gameWon')
    ..aOM<$3.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeStamp', protoName: 'timeStamp', subBuilder: $3.Timestamp.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId', protoName: 'gameId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', protoName: 'playerId')
    ..hasRequiredFields = false
  ;

  ResultModel._() : super();
  factory ResultModel({
    $core.int? eloDiff,
    $core.int? newElo,
    $core.bool? gameWon,
    $3.Timestamp? timeStamp,
    $core.String? gameId,
    $core.String? playerId,
  }) {
    final _result = create();
    if (eloDiff != null) {
      _result.eloDiff = eloDiff;
    }
    if (newElo != null) {
      _result.newElo = newElo;
    }
    if (gameWon != null) {
      _result.gameWon = gameWon;
    }
    if (timeStamp != null) {
      _result.timeStamp = timeStamp;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory ResultModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultModel clone() => ResultModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultModel copyWith(void Function(ResultModel) updates) => super.copyWith((message) => updates(message as ResultModel)) as ResultModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultModel create() => ResultModel._();
  ResultModel createEmptyInstance() => create();
  static $pb.PbList<ResultModel> createRepeated() => $pb.PbList<ResultModel>();
  @$core.pragma('dart2js:noInline')
  static ResultModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultModel>(create);
  static ResultModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get eloDiff => $_getIZ(0);
  @$pb.TagNumber(1)
  set eloDiff($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEloDiff() => $_has(0);
  @$pb.TagNumber(1)
  void clearEloDiff() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get newElo => $_getIZ(1);
  @$pb.TagNumber(2)
  set newElo($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewElo() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewElo() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get gameWon => $_getBF(2);
  @$pb.TagNumber(3)
  set gameWon($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameWon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameWon() => clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get timeStamp => $_getN(3);
  @$pb.TagNumber(4)
  set timeStamp($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimeStamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimeStamp() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureTimeStamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get gameId => $_getSZ(4);
  @$pb.TagNumber(5)
  set gameId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGameId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get playerId => $_getSZ(5);
  @$pb.TagNumber(6)
  set playerId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlayerId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayerId() => clearField(6);
}

