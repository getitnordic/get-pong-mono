import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/models.dart';
import '../../domain/use_cases/use_cases.dart';
import 'players_notifier.dart';

final matchesProvider =
    StateNotifierProvider<MatchesNotifier, List<GameModel>>((ref) {
  return MatchesNotifier(
      [], getIt<GetGamesUseCase>(), getIt<SaveGameUseCase>(), ref.read);
});

final playerGamesProvider = FutureProvider.family
    .autoDispose<List<GameModel>, String>((ref, playerId) async {
  return ref.read(matchesProvider.notifier).getMatchesByPlayerId(playerId);
});

final fetchingMatchesProvider = StateProvider<bool>((ref) => false);

class MatchesNotifier extends StateNotifier<List<GameModel>> {
  final GetGamesUseCase getGamesUseCase;
  final SaveGameUseCase saveGameUseCase;
  final Reader read;

  MatchesNotifier(List<GameModel> state, this.getGamesUseCase,
      this.saveGameUseCase, this.read)
      : super(state);

  void addMatch(GameModel match) async {
    // if (state.isEmpty) {
    //   await fetchGames();
    // }
    // state = [...state, match];
  }

  Future<DataState<String>> createGame(GameModel game) async {
    addMatch(game);
    return await saveGameUseCase(params: game);
  }

  Future<void> fetchGames() async {
    setFetchingMatches(true);

    // if (state.isNotEmpty) {
    //   setFetchingMatches(false);
    //   return;
    // }
    await read(playersProvider.notifier).fetchPlayers();
    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 10))
        .then((value) => {
              if (value is DataSuccess)
                {
                  setFetchingMatches(false),
                  state = value.data!,
                }
              else
                {
                  setFetchingMatches(false),
                }
            });
    state.sort((a, b) => DateTime.fromMicrosecondsSinceEpoch(
            b.timeStamp.toInt() * 1000)
        .compareTo(
            DateTime.fromMicrosecondsSinceEpoch(a.timeStamp.toInt() * 1000)));
  }

  void setFetchingMatches(bool loadingState) {
    read(fetchingMatchesProvider.notifier).state = loadingState;
  }

  Future<List<GameModel>> getMatchesByPlayerId(String id) async {
    List<GameModel> matches = [];
    List<GameModel> playerGames = [];
    const amountOfMatchesToGrab = 5;
    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100))
        .then((value) => {
              if (value is DataSuccess)
                {
                  setFetchingMatches(false),
                  matches = value.data!,
                }
              else
                {
                  setFetchingMatches(false),
                }
            });
    matches.sort((a, b) => DateTime.fromMicrosecondsSinceEpoch(
            b.timeStamp.toInt() * 1000)
        .compareTo(
            DateTime.fromMicrosecondsSinceEpoch(a.timeStamp.toInt() * 1000)));
    for (GameModel match in matches) {
      if (match.homeTeamIds[0] == id) {
        playerGames.add(match);
      }
      if (match.awayTeamIds[0] == id) {
        playerGames.add(match);
      }
    }
    return playerGames.take(amountOfMatchesToGrab).toList();
  }

  Future<List<GameModel>> getNextTenMatches(int offset) async {
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
    matches.sort((a, b) => DateTime.fromMicrosecondsSinceEpoch(
            b.timeStamp.toInt() * 1000)
        .compareTo(
            DateTime.fromMicrosecondsSinceEpoch(a.timeStamp.toInt() * 1000)));

    return matches;
  }
}
