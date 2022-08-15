import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

import '../../../protos/protos.dart';
import '../../core/common/data_state.dart';
import '../../domain/clients/clients.dart';

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
}
