import '../../../../protos/game.pbgrpc.dart';
import '../../../core/common/common.dart';
import '../../../core/models/get_games_params.dart';
import '../../clients/game_repository.dart';

class GetGamesUseCase
    implements UseCase<DataState<List<GameModel>>, GetGamesParams> {
  final GameRepository service;

  GetGamesUseCase(this.service);

  @override
  Future<DataState<List<GameModel>>> call(
      {required GetGamesParams params}) async {
    return await service.getGames(params);
  }
}
