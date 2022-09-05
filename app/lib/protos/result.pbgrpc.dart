///
//  Generated code. Do not modify.
//  source: result.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'result.pb.dart' as $2;
export 'result.pb.dart';

class ResultServiceClient extends $grpc.Client {
  static final _$getResultByGameId = $grpc.ClientMethod<
          $2.GetResultByGameIdRequest, $2.GetResultByGameIdReply>(
      '/ResultService/GetResultByGameId',
      ($2.GetResultByGameIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.GetResultByGameIdReply.fromBuffer(value));
  static final _$getResultsByPlayerId = $grpc.ClientMethod<
          $2.GetResultsByPlayerIdRequest, $2.GetResultsByPlayerIdReply>(
      '/ResultService/GetResultsByPlayerId',
      ($2.GetResultsByPlayerIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.GetResultsByPlayerIdReply.fromBuffer(value));
  static final _$saveResult =
      $grpc.ClientMethod<$2.SaveResultRequest, $2.SaveResultReply>(
          '/ResultService/SaveResult',
          ($2.SaveResultRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.SaveResultReply.fromBuffer(value));

  ResultServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.GetResultByGameIdReply> getResultByGameId(
      $2.GetResultByGameIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getResultByGameId, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetResultsByPlayerIdReply> getResultsByPlayerId(
      $2.GetResultsByPlayerIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getResultsByPlayerId, request, options: options);
  }

  $grpc.ResponseFuture<$2.SaveResultReply> saveResult(
      $2.SaveResultRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveResult, request, options: options);
  }
}

abstract class ResultServiceBase extends $grpc.Service {
  $core.String get $name => 'ResultService';

  ResultServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetResultByGameIdRequest,
            $2.GetResultByGameIdReply>(
        'GetResultByGameId',
        getResultByGameId_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetResultByGameIdRequest.fromBuffer(value),
        ($2.GetResultByGameIdReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetResultsByPlayerIdRequest,
            $2.GetResultsByPlayerIdReply>(
        'GetResultsByPlayerId',
        getResultsByPlayerId_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetResultsByPlayerIdRequest.fromBuffer(value),
        ($2.GetResultsByPlayerIdReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SaveResultRequest, $2.SaveResultReply>(
        'SaveResult',
        saveResult_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SaveResultRequest.fromBuffer(value),
        ($2.SaveResultReply value) => value.writeToBuffer()));
  }

  $async.Future<$2.GetResultByGameIdReply> getResultByGameId_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetResultByGameIdRequest> request) async {
    return getResultByGameId(call, await request);
  }

  $async.Future<$2.GetResultsByPlayerIdReply> getResultsByPlayerId_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.GetResultsByPlayerIdRequest> request) async {
    return getResultsByPlayerId(call, await request);
  }

  $async.Future<$2.SaveResultReply> saveResult_Pre($grpc.ServiceCall call,
      $async.Future<$2.SaveResultRequest> request) async {
    return saveResult(call, await request);
  }

  $async.Future<$2.GetResultByGameIdReply> getResultByGameId(
      $grpc.ServiceCall call, $2.GetResultByGameIdRequest request);
  $async.Future<$2.GetResultsByPlayerIdReply> getResultsByPlayerId(
      $grpc.ServiceCall call, $2.GetResultsByPlayerIdRequest request);
  $async.Future<$2.SaveResultReply> saveResult(
      $grpc.ServiceCall call, $2.SaveResultRequest request);
}
