import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../protos/game.pbgrpc.dart';
import '../../../core/common/common.dart';
import '../../../core/models/get_games_params.dart';
import 'games_providers.dart';

class GamesController extends StateNotifier<List<GameModel>> {
  final UseCase getGamesUseCase;
  final UseCase getGamesByPlayerIdUseCase;
  final UseCase saveGameUseCase;
  final Reader read;
  GamesController(
    this.getGamesUseCase,
    this.getGamesByPlayerIdUseCase,
    this.saveGameUseCase,
    this.read,
  ) : super([]) {
    fetchGames();
  }

  void _setLoading(bool value) {
    read(gamesLoadingProvider.notifier).update((state) => value);
  }

  Future<bool> fetchGames() async {
    _setLoading(true);
    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 10))
        .then((value) => {
              if (value is DataSuccess)
                {
                  state = value.data,
                }
              else
                {}
            });
    _sortByLatestDate();
    _setLoading(false);
    return true;
  }

  void _sortByLatestDate() {
    return state.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));
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
    _setLoading(true);
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
    _setLoading(false);
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

  Future<void> createGame(GameModel game) async {
    await saveGameUseCase(params: game);
    await fetchGames();
  }
}
