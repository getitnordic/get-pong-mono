import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/register_services.dart';
import 'package:get_pong/src/core/models/get_games_params.dart';

import '../../core/common/common.dart';
import '../../domain/use_cases/use_cases.dart';

final matchProvider = StateNotifierProvider<MatchNotifier, List<GameModel>>(
    (ref) => MatchNotifier(getIt<GetGames>(), getIt<SaveGame>()));

class MatchNotifier extends StateNotifier<List<GameModel>> {
  final GetGames getGames;
  final SaveGame saveGame;

  MatchNotifier(this.getGames, this.saveGame) : super([]);

  void addMatch(GameModel match) {
    state = [...state, match];
  }

  Future<DataState<List<GameModel>>> fetchGames() async {
    final response =
        await getGames(params: GetGamesParams(offset: 0, limit: 100));

    List<GameModel> games = [];

    if (response is DataSuccess) {
      games = response.data!;
    }
    state = games;

    return response;
  }

  Future<DataState<String>> createGame(GameModel game) async {
    return await saveGame(params: game);
  }

  List<GameModel> getMatchesByPlayerId(String id) {
    List<GameModel> matches = [];
    for (GameModel match in state) {
      if (match.homeTeamIds[0] == id) {
        matches.add(match);
      }
      if (match.awayTeamIds[0] == id) {
        matches.add(match);
      }
    }
    return matches;
  }
}
