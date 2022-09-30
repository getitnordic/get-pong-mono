import 'package:flutter/foundation.dart';
import 'package:get_pong/src/core/models/update_profile_picture_params.dart';
import 'package:grpc/grpc.dart';

import '../../../protos/protos.dart';
import '../../core/common/data_state.dart';
import '../../domain/repositories/repositories.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerServiceClient client;

  PlayerRepositoryImpl(this.client);

  @override
  Future<DataState<String>> addPlayer(PlayerModel player) async {
    final request = RegisterExternalRequest(
      fullName: player.fullName,
      nickname: player.nickname,
      email: player.email,
    );

    try {
      await client.registerExternal(request);
      return const DataSuccess('Player created');
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<PlayerModel>>> getPlayers() async {
    final request = GetPlayersRequest();

    try {
      final response = await client.getPlayers(request);
      return DataSuccess(response.playerModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PlayerModel>> updatePlayer(PlayerModel player) async {
    final request = UpdatePlayerRequest(playerModel: player);

    try {
      final response = await client.updatePlayer(request);
      return DataSuccess(response.playerModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> updateProfilePicture(
      UpdateProfilePictureParams params) async {
    final updateRequest = UpdatePlayerPictureRequest(
      playerId: params.id,
      base64Data: params.data,
    );
    final deleteRequest = DeletePlayerPictureRequest(
      playerId: params.id,
    );

    try {
      await client.deletePlayerPicture(deleteRequest);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      try {
        final response = await client.updatePlayerPicture(updateRequest);
        return DataSuccess(response.responseMessage);
      } on GrpcError catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return DataFailed(e);
      }
    }
  }
}
