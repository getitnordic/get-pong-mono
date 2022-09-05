///
//  Generated code. Do not modify.
//  source: player.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'player.pb.dart' as $0;
export 'player.pb.dart';

class PlayerServiceClient extends $grpc.Client {
  static final _$registerExternal =
      $grpc.ClientMethod<$0.RegisterExternalRequest, $0.RegisterExternalReply>(
          '/player.PlayerService/RegisterExternal',
          ($0.RegisterExternalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterExternalReply.fromBuffer(value));
  static final _$getPlayers =
      $grpc.ClientMethod<$0.GetPlayersRequest, $0.GetPlayersReply>(
          '/player.PlayerService/GetPlayers',
          ($0.GetPlayersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPlayersReply.fromBuffer(value));
  static final _$getPlayerById =
      $grpc.ClientMethod<$0.GetPlayerByIdRequest, $0.GetPlayerByIdReply>(
          '/player.PlayerService/GetPlayerById',
          ($0.GetPlayerByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPlayerByIdReply.fromBuffer(value));
  static final _$updatePlayer =
      $grpc.ClientMethod<$0.UpdatePlayerRequest, $0.UpdatePlayerReply>(
          '/player.PlayerService/UpdatePlayer',
          ($0.UpdatePlayerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePlayerReply.fromBuffer(value));
  static final _$syncAzureAdToDb =
      $grpc.ClientMethod<$0.SyncAzureAdToDbRequest, $0.SyncAzureAdToDbReply>(
          '/player.PlayerService/SyncAzureAdToDb',
          ($0.SyncAzureAdToDbRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SyncAzureAdToDbReply.fromBuffer(value));
  static final _$updatePlayerPicture = $grpc.ClientMethod<
          $0.UpdatePlayerPictureRequest, $0.UpdatePlayerPictureReply>(
      '/player.PlayerService/UpdatePlayerPicture',
      ($0.UpdatePlayerPictureRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdatePlayerPictureReply.fromBuffer(value));
  static final _$deletePlayerPicture = $grpc.ClientMethod<
          $0.DeletePlayerPictureRequest, $0.DeletePlayerPictureReply>(
      '/player.PlayerService/DeletePlayerPicture',
      ($0.DeletePlayerPictureRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeletePlayerPictureReply.fromBuffer(value));

  PlayerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RegisterExternalReply> registerExternal(
      $0.RegisterExternalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerExternal, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPlayersReply> getPlayers(
      $0.GetPlayersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlayers, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPlayerByIdReply> getPlayerById(
      $0.GetPlayerByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlayerById, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlayerReply> updatePlayer(
      $0.UpdatePlayerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.SyncAzureAdToDbReply> syncAzureAdToDb(
      $0.SyncAzureAdToDbRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$syncAzureAdToDb, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlayerPictureReply> updatePlayerPicture(
      $0.UpdatePlayerPictureRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePlayerPicture, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePlayerPictureReply> deletePlayerPicture(
      $0.DeletePlayerPictureRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePlayerPicture, request, options: options);
  }
}

abstract class PlayerServiceBase extends $grpc.Service {
  $core.String get $name => 'player.PlayerService';

  PlayerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterExternalRequest,
            $0.RegisterExternalReply>(
        'RegisterExternal',
        registerExternal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterExternalRequest.fromBuffer(value),
        ($0.RegisterExternalReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayersRequest, $0.GetPlayersReply>(
        'GetPlayers',
        getPlayers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPlayersRequest.fromBuffer(value),
        ($0.GetPlayersReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetPlayerByIdRequest, $0.GetPlayerByIdReply>(
            'GetPlayerById',
            getPlayerById_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetPlayerByIdRequest.fromBuffer(value),
            ($0.GetPlayerByIdReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdatePlayerRequest, $0.UpdatePlayerReply>(
            'UpdatePlayer',
            updatePlayer_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdatePlayerRequest.fromBuffer(value),
            ($0.UpdatePlayerReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SyncAzureAdToDbRequest, $0.SyncAzureAdToDbReply>(
            'SyncAzureAdToDb',
            syncAzureAdToDb_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SyncAzureAdToDbRequest.fromBuffer(value),
            ($0.SyncAzureAdToDbReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePlayerPictureRequest,
            $0.UpdatePlayerPictureReply>(
        'UpdatePlayerPicture',
        updatePlayerPicture_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePlayerPictureRequest.fromBuffer(value),
        ($0.UpdatePlayerPictureReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePlayerPictureRequest,
            $0.DeletePlayerPictureReply>(
        'DeletePlayerPicture',
        deletePlayerPicture_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeletePlayerPictureRequest.fromBuffer(value),
        ($0.DeletePlayerPictureReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterExternalReply> registerExternal_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RegisterExternalRequest> request) async {
    return registerExternal(call, await request);
  }

  $async.Future<$0.GetPlayersReply> getPlayers_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPlayersRequest> request) async {
    return getPlayers(call, await request);
  }

  $async.Future<$0.GetPlayerByIdReply> getPlayerById_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPlayerByIdRequest> request) async {
    return getPlayerById(call, await request);
  }

  $async.Future<$0.UpdatePlayerReply> updatePlayer_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdatePlayerRequest> request) async {
    return updatePlayer(call, await request);
  }

  $async.Future<$0.SyncAzureAdToDbReply> syncAzureAdToDb_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SyncAzureAdToDbRequest> request) async {
    return syncAzureAdToDb(call, await request);
  }

  $async.Future<$0.UpdatePlayerPictureReply> updatePlayerPicture_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdatePlayerPictureRequest> request) async {
    return updatePlayerPicture(call, await request);
  }

  $async.Future<$0.DeletePlayerPictureReply> deletePlayerPicture_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeletePlayerPictureRequest> request) async {
    return deletePlayerPicture(call, await request);
  }

  $async.Future<$0.RegisterExternalReply> registerExternal(
      $grpc.ServiceCall call, $0.RegisterExternalRequest request);
  $async.Future<$0.GetPlayersReply> getPlayers(
      $grpc.ServiceCall call, $0.GetPlayersRequest request);
  $async.Future<$0.GetPlayerByIdReply> getPlayerById(
      $grpc.ServiceCall call, $0.GetPlayerByIdRequest request);
  $async.Future<$0.UpdatePlayerReply> updatePlayer(
      $grpc.ServiceCall call, $0.UpdatePlayerRequest request);
  $async.Future<$0.SyncAzureAdToDbReply> syncAzureAdToDb(
      $grpc.ServiceCall call, $0.SyncAzureAdToDbRequest request);
  $async.Future<$0.UpdatePlayerPictureReply> updatePlayerPicture(
      $grpc.ServiceCall call, $0.UpdatePlayerPictureRequest request);
  $async.Future<$0.DeletePlayerPictureReply> deletePlayerPicture(
      $grpc.ServiceCall call, $0.DeletePlayerPictureRequest request);
}
