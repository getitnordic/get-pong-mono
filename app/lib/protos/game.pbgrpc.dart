///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'game.pb.dart' as $0;
export 'game.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$getGames =
      $grpc.ClientMethod<$0.GetGamesRequest, $0.GetGamesReply>(
          '/game.GameService/GetGames',
          ($0.GetGamesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetGamesReply.fromBuffer(value));
  static final _$saveGame =
      $grpc.ClientMethod<$0.SaveGameRequest, $0.SaveGameReply>(
          '/game.GameService/SaveGame',
          ($0.SaveGameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SaveGameReply.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetGamesReply> getGames($0.GetGamesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGames, request, options: options);
  }

  $grpc.ResponseFuture<$0.SaveGameReply> saveGame($0.SaveGameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveGame, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'game.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetGamesRequest, $0.GetGamesReply>(
        'GetGames',
        getGames_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGamesRequest.fromBuffer(value),
        ($0.GetGamesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SaveGameRequest, $0.SaveGameReply>(
        'SaveGame',
        saveGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SaveGameRequest.fromBuffer(value),
        ($0.SaveGameReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetGamesReply> getGames_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetGamesRequest> request) async {
    return getGames(call, await request);
  }

  $async.Future<$0.SaveGameReply> saveGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SaveGameRequest> request) async {
    return saveGame(call, await request);
  }

  $async.Future<$0.GetGamesReply> getGames(
      $grpc.ServiceCall call, $0.GetGamesRequest request);
  $async.Future<$0.SaveGameReply> saveGame(
      $grpc.ServiceCall call, $0.SaveGameRequest request);
}
