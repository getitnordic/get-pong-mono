import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/src/core/models/get_games_params.dart';
import 'package:get_pong/src/domain/clients/game_repository.dart';

class GetGames implements UseCase<DataState<List<GameModel>>, GetGamesParams> {
  final GameRepository service;

  GetGames(this.service);

  @override
  Future<DataState<List<GameModel>>> call(
      {required GetGamesParams params}) async {
    return await service.getGames(params);
  }
}
