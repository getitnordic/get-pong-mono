import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/models/get_games_params.dart';

import '../../core/common/common.dart';

abstract class GameRepository {
  Future<DataState<List<GameModel>>> getGames(GetGamesParams params);
  Future<DataState<String>> saveGame(GameModel game);
}
