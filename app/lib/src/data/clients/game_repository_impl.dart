import 'package:flutter/foundation.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/common/data_state.dart';
import 'package:get_pong/src/core/models/get_games_params.dart';
import 'package:get_pong/src/domain/clients/game_repository.dart';
import 'package:grpc/grpc.dart';

class GameRepositoryImpl implements GameRepository {
  final GameServiceClient client;

  GameRepositoryImpl(this.client);

  @override
  Future<DataState<List<GameModel>>> getGames(GetGamesParams params) async {
    final request = GetGamesRequest(
      limit: params.limit,
      offset: params.offset,
    );

    try {
      final response = await client.getGames(request);
      return DataSuccess(response.gameModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> saveGame(GameModel game) async {
    final request = SaveGameRequest(gameModel: game);

    try {
      await client.saveGame(request);
      return const DataSuccess('Player created');
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }
}
