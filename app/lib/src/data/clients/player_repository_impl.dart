import 'package:flutter/foundation.dart';
import 'package:get_pong/protos/base.pbgrpc.dart';
import 'package:get_pong/protos/player.pbgrpc.dart';
import 'package:get_pong/src/core/common/data_state.dart';
import 'package:grpc/grpc.dart';

import '../../domain/clients/clients.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerServiceClient client;

  PlayerRepositoryImpl(this.client);

  @override
  Future<DataState<String>> addPlayer(PlayerModel player) async {
    final request = RegisterExternalRequest(
      firstName: player.firstName,
      lastName: player.lastName,
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
}
