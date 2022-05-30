///
//  Generated code. Do not modify.
//  source: leaderboard.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'leaderboard.pb.dart' as $0;
export 'leaderboard.pb.dart';

class LeaderboardServiceClient extends $grpc.Client {
  static final _$getLeaderboard =
      $grpc.ClientMethod<$0.GetLeaderboardRequest, $0.GetLeaderboardReply>(
          '/leaderboard.LeaderboardService/GetLeaderboard',
          ($0.GetLeaderboardRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetLeaderboardReply.fromBuffer(value));
  static final _$getLeaderboardById = $grpc.ClientMethod<
          $0.GetLeaderboardModelByIdRequest, $0.GetLeaderboardModelByIdReply>(
      '/leaderboard.LeaderboardService/getLeaderboardById',
      ($0.GetLeaderboardModelByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetLeaderboardModelByIdReply.fromBuffer(value));

  LeaderboardServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetLeaderboardReply> getLeaderboard(
      $0.GetLeaderboardRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLeaderboard, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLeaderboardModelByIdReply> getLeaderboardById(
      $0.GetLeaderboardModelByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLeaderboardById, request, options: options);
  }
}

abstract class LeaderboardServiceBase extends $grpc.Service {
  $core.String get $name => 'leaderboard.LeaderboardService';

  LeaderboardServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetLeaderboardRequest, $0.GetLeaderboardReply>(
            'GetLeaderboard',
            getLeaderboard_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetLeaderboardRequest.fromBuffer(value),
            ($0.GetLeaderboardReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLeaderboardModelByIdRequest,
            $0.GetLeaderboardModelByIdReply>(
        'getLeaderboardById',
        getLeaderboardById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetLeaderboardModelByIdRequest.fromBuffer(value),
        ($0.GetLeaderboardModelByIdReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetLeaderboardReply> getLeaderboard_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetLeaderboardRequest> request) async {
    return getLeaderboard(call, await request);
  }

  $async.Future<$0.GetLeaderboardModelByIdReply> getLeaderboardById_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetLeaderboardModelByIdRequest> request) async {
    return getLeaderboardById(call, await request);
  }

  $async.Future<$0.GetLeaderboardReply> getLeaderboard(
      $grpc.ServiceCall call, $0.GetLeaderboardRequest request);
  $async.Future<$0.GetLeaderboardModelByIdReply> getLeaderboardById(
      $grpc.ServiceCall call, $0.GetLeaderboardModelByIdRequest request);
}
