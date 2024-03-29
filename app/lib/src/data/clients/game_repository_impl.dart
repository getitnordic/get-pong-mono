import 'package:flutter/foundation.dart';
import 'package:get_pong/src/core/models/get_win_probability_params.dart';
import 'package:grpc/grpc.dart';

import '../../../protos/game.pbgrpc.dart';
import '../../core/common/data_state.dart';
import '../../core/models/get_games_params.dart';
import '../../domain/repositories/game_repository.dart';

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

  @override
  Future<DataState<List<GameModel>>> getGamesByPlayerId(String id) async {
    final request = GetGamesByPlayerIdRequest(id: id);

    try {
      final response = await client.getGamesById(request);
      return DataSuccess(response.gameModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<double>> getWinProbability(
      GetWinProbabilityParams params) async {
    final request = GetWinProbabilityRequest(
      homeTeamElo: params.homeTeamElo,
      awayTeamElo: params.awayTeamElo,
    );

    try {
      final response = await client.getWinProbability(request);
      return DataSuccess(response.winProbability);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }
}
