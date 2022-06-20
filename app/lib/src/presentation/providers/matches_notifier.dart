import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/models.dart';
import '../../domain/use_cases/use_cases.dart';

final matchesProvider =
    StateNotifierProvider<MatchesNotifier, List<GameModel>>((ref) {
  return MatchesNotifier(
      [], getIt<GetGamesUseCase>(), getIt<SaveGameUseCase>(), ref.read);
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
    if (state.isEmpty) {
      await fetchGames();
    }
    state = [...state, match];
  }

  Future<DataState<String>> createGame(GameModel game) async {
    addMatch(game);
    return await saveGameUseCase(params: game);
  }

  Future<void> fetchGames() async {
    setFetchingMatches(true);
    if (state.isNotEmpty) {
      setFetchingMatches(false);
      return;
    }

    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100))
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
  }

  void setFetchingMatches(bool loadingState) {
    read(fetchingMatchesProvider.notifier).state = loadingState;
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