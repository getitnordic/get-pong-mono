import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/get_games_params.dart';
import '../../domain/use_cases/games/get_games_usecase.dart';
import '../../domain/use_cases/results/get_result_by_game_id_usecase.dart';

final resultByGameIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, gameId) async {
  final response = await getIt<GetResultByGameIdUseCase>().call(params: gameId);

  return response.data!;
});

final resultsLoadingProvider = StateProvider<bool>((ref) => false);

final resultsProvider =
    StateNotifierProvider<ResultNotifier, List<ResultModel>>((ref) {
  return ResultNotifier(
    getIt<GetResultByGameIdUseCase>(),
    getIt<GetGamesUseCase>(),
    ref.read,
  );
});

class ResultNotifier extends StateNotifier<List<ResultModel>> {
  final UseCase getByGameId;
  final UseCase getGames;
  final Reader read;
  ResultNotifier(this.getByGameId, this.getGames, this.read) : super([]);

  void fetchAllResults() async {
    _toggleLoading();

    final DataState<List<GameModel>> gamesResponse = await getGames(
        params: GetGamesParams(
      limit: 10000,
      offset: 0,
    ));
    final games = gamesResponse.data!;

    for (GameModel game in games) {
      final result = await getByGameId(params: game.id);

      if (result.data!.asMap().containsKey(0)) {
        _addResult(result.data![0]);
      }
      if (result.data!.asMap().containsKey(1)) {
        _addResult(result.data![1]);
      }
    }

    _toggleLoading();
  }

  void _addResult(ResultModel result) {
    state = [...state, result];
  }

  void _toggleLoading() {
    read(resultsLoadingProvider.notifier).state = !read(resultsLoadingProvider);
  }
}
