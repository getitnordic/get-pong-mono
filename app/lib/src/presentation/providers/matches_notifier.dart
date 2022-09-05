import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/models.dart';
import '../../domain/use_cases/games/get_games_by_id_usecase.dart';
import '../../domain/use_cases/use_cases.dart';
import 'players_notifier.dart';

final matchesProvider =
    StateNotifierProvider<MatchesNotifier, List<GameModel>>((ref) {
  return MatchesNotifier([], getIt<GetGamesUseCase>(), getIt<SaveGameUseCase>(),
      getIt<GetGamesByPlayerIdUseCase>(), ref.read);
});

final playerGamesProvider = FutureProvider.family
    .autoDispose<List<GameModel>, String>((ref, playerId) async {
  return ref.watch(matchesProvider.notifier).getMatchesByPlayerId(playerId);
});

final allGamesProvider = FutureProvider<List<GameModel>>((ref) async {
  return ref.watch(matchesProvider.notifier).fetchAllGames();
});

final fetchingMatchesProvider = StateProvider<bool>((ref) => false);

class MatchesNotifier extends StateNotifier<List<GameModel>> {
  final UseCase getGamesUseCase;
  final UseCase saveGameUseCase;
  final UseCase getGamesByPlayerIdUseCase;
  final Reader read;

  MatchesNotifier(
    List<GameModel> state,
    this.getGamesUseCase,
    this.saveGameUseCase,
    this.getGamesByPlayerIdUseCase,
    this.read,
  ) : super([]);

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
    state.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));
  }

  Future<List<GameModel>> fetchAllGames() async {
    setFetchingMatches(true);

    // if (state.isNotEmpty) {
    //   setFetchingMatches(false);
    //   return;
    // }
    late List<GameModel> games;
    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100000))
        .then((value) => {
              if (value is DataSuccess)
                {
                  setFetchingMatches(false),
                  state = value.data,
                  games = value.data,
                }
              else
                {
                  setFetchingMatches(false),
                }
            });
    state.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));
    return games;
  }

  void setFetchingMatches(bool loadingState) {
    read(fetchingMatchesProvider.notifier).state = loadingState;
  }

  Future<List<GameModel>> getMatchesByPlayerId(String id) async {
    List<GameModel> matches = [];
    const amountOfMatchesToGrab = 5;
    await getGamesByPlayerIdUseCase(params: id).then((value) => {
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
    matches.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));

    return matches.take(amountOfMatchesToGrab).toList();
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
    matches.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));

    return matches;
  }
}
