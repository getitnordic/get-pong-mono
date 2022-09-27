import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../protos/game.pbgrpc.dart';
import '../../../core/common/common.dart';
import '../../../core/models/get_games_params.dart';
import '../app_loading_provider.dart';

class GamesNotifier extends StateNotifier<List<GameModel>> {
  final UseCase getGamesUseCase;
  final UseCase getGamesByPlayerIdUseCase;
  final UseCase saveGameUseCase;
  final Reader read;
  GamesNotifier(
    this.getGamesUseCase,
    this.getGamesByPlayerIdUseCase,
    this.saveGameUseCase,
    this.read,
  ) : super([]) {
    fetchGames();
  }

  void _setLoading(bool value) {
    read(appLoadingProvider.notifier).update((state) => value);
  }

  Future<bool> fetchGames() async {
    _setLoading(true);
    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100000))
        .then((value) => {
              if (value is DataSuccess)
                {
                  state = value.data,
                }
              else
                {}
            });
    state.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));
    _setLoading(false);
    return true;
  }

  Future<List<GameModel>> getMatchesByPlayerId(String id) async {
    List<GameModel> matches = [];

    await getGamesByPlayerIdUseCase(params: id).then((value) => {
          if (value is DataSuccess)
            {
              matches = value.data!,
            }
        });
    matches.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));

    return matches;
  }

  Future<List<GameModel>> getNextTenGames(int offset) async {
    List<GameModel> matches = [];
    await getGamesUseCase(params: GetGamesParams(offset: offset, limit: 10))
        .then((value) => {
              if (value is DataSuccess)
                {
                  matches = value.data!,
                }
              else
                {print(value.error)}
            });
    matches.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));

    return matches;
  }

  List<GameModel> getGamesByPlayerId(String id) {
    List<GameModel> games = [];
    const amountOfMatchesToGrab = 5;
    for (var game in state) {
      for (var playerId in game.homeTeamIds) {
        if (playerId == id) {
          games.add(game);
        }
      }
      for (var playerId in game.awayTeamIds) {
        if (playerId == id) {
          games.add(game);
        }
      }
    }

    return games.take(amountOfMatchesToGrab).toList();
  }

  Future<DataState<String>> createGame(GameModel game) async {
    return await saveGameUseCase(params: game);
  }
}
