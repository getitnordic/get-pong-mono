import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/register_services.dart';
import 'package:get_pong/src/core/models/get_games_params.dart';

import '../../core/common/common.dart';
import '../../domain/use_cases/use_cases.dart';

final matchProvider = StateNotifierProvider<MatchNotifier, List<GameModel>>(
    (ref) => MatchNotifier(
        getIt<GetGamesUseCase>(), getIt<SaveGameUseCase>(), ref.read));

final matchesLoadingProvider = StateProvider<bool>((ref) => false);

class MatchNotifier extends StateNotifier<List<GameModel>> {
  final GetGamesUseCase getGamesUseCase;
  final SaveGameUseCase saveGameUseCase;
  final Reader read;

  MatchNotifier(this.getGamesUseCase, this.saveGameUseCase, this.read)
      : super([]);

  void addMatch(GameModel match) async {
    if (state.isEmpty) {
      await fetchGames();
    }
    state = [...state, match];
  }

  Future<void> fetchGames() async {
    setMatchesLoading(true);
    print('INITIATING: ${read(matchesLoadingProvider)}');
    if (state.isNotEmpty) {
      setMatchesLoading(false);
      print(
          'IS NOT EMPTY: ${read(matchesLoadingProvider)} STATE: ${state.length}');
      return;
    }

    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100))
        .then((value) => {
              if (value is DataSuccess)
                {
                  setMatchesLoading(false),
                  print('SUCCESS: ${read(matchesLoadingProvider)}'),
                  print(state.length),
                  state = value.data!,
                  print(state.length),
                }
              else
                {
                  setMatchesLoading(false),
                  print('FAILED: ${read(matchesLoadingProvider)}'),
                  print(value.error)
                }
            });
  }

  Future<DataState<String>> createGame(GameModel game) async {
    return await saveGameUseCase(params: game);
  }

  void setMatchesLoading(bool loadingState) {
    read(matchesLoadingProvider.notifier).state = loadingState;
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
