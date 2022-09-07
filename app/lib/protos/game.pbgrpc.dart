///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'game.pb.dart' as $1;
export 'game.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$getGames =
      $grpc.ClientMethod<$1.GetGamesRequest, $1.GetGamesReply>(
          '/game.GameService/GetGames',
          ($1.GetGamesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.GetGamesReply.fromBuffer(value));
  static final _$saveGame =
      $grpc.ClientMethod<$1.SaveGameRequest, $1.SaveGameReply>(
          '/game.GameService/SaveGame',
          ($1.SaveGameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SaveGameReply.fromBuffer(value));
  static final _$getGamesById = $grpc.ClientMethod<$1.GetGamesByPlayerIdRequest,
          $1.GetGamesByPlayerIdReply>(
      '/game.GameService/GetGamesById',
      ($1.GetGamesByPlayerIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetGamesByPlayerIdReply.fromBuffer(value));
  static final _$getWinProbability = $grpc.ClientMethod<
          $1.GetWinProbabilityRequest, $1.GetWinProbabilityReply>(
      '/game.GameService/GetWinProbability',
      ($1.GetWinProbabilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetWinProbabilityReply.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetGamesReply> getGames($1.GetGamesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGames, request, options: options);
  }

  $grpc.ResponseFuture<$1.SaveGameReply> saveGame($1.SaveGameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveGame, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetGamesByPlayerIdReply> getGamesById(
      $1.GetGamesByPlayerIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGamesById, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetWinProbabilityReply> getWinProbability(
      $1.GetWinProbabilityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWinProbability, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'game.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetGamesRequest, $1.GetGamesReply>(
        'GetGames',
        getGames_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetGamesRequest.fromBuffer(value),
        ($1.GetGamesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SaveGameRequest, $1.SaveGameReply>(
        'SaveGame',
        saveGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SaveGameRequest.fromBuffer(value),
        ($1.SaveGameReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetGamesByPlayerIdRequest,
            $1.GetGamesByPlayerIdReply>(
        'GetGamesById',
        getGamesById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetGamesByPlayerIdRequest.fromBuffer(value),
        ($1.GetGamesByPlayerIdReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetWinProbabilityRequest,
            $1.GetWinProbabilityReply>(
        'GetWinProbability',
        getWinProbability_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetWinProbabilityRequest.fromBuffer(value),
        ($1.GetWinProbabilityReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetGamesReply> getGames_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetGamesRequest> request) async {
    return getGames(call, await request);
  }

  $async.Future<$1.SaveGameReply> saveGame_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SaveGameRequest> request) async {
    return saveGame(call, await request);
  }

  $async.Future<$1.GetGamesByPlayerIdReply> getGamesById_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetGamesByPlayerIdRequest> request) async {
    return getGamesById(call, await request);
  }

  $async.Future<$1.GetWinProbabilityReply> getWinProbability_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetWinProbabilityRequest> request) async {
    return getWinProbability(call, await request);
  }

  $async.Future<$1.GetGamesReply> getGames(
      $grpc.ServiceCall call, $1.GetGamesRequest request);
  $async.Future<$1.SaveGameReply> saveGame(
      $grpc.ServiceCall call, $1.SaveGameRequest request);
  $async.Future<$1.GetGamesByPlayerIdReply> getGamesById(
      $grpc.ServiceCall call, $1.GetGamesByPlayerIdRequest request);
  $async.Future<$1.GetWinProbabilityReply> getWinProbability(
      $grpc.ServiceCall call, $1.GetWinProbabilityRequest request);
}
