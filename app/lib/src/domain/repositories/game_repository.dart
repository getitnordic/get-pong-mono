import 'package:get_pong/src/core/models/get_win_probability_params.dart';

import '../../../protos/game.pbgrpc.dart';
import '../../core/common/common.dart';
import '../../core/models/get_games_params.dart';

abstract class GameRepository {
  Future<DataState<List<GameModel>>> getGames(GetGamesParams params);
  Future<DataState<String>> saveGame(GameModel game);
  Future<DataState<List<GameModel>>> getGamesByPlayerId(String id);
  Future<DataState<double>> getWinProbability(GetWinProbabilityParams params);
}
