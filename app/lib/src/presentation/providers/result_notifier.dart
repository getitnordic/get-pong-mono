import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../domain/use_cases/results/get_latest_results_usecase.dart';
import '../../domain/use_cases/results/get_result_by_game_id_usecase.dart';
import '../../domain/use_cases/results/get_results_by_player_id_usecase.dart';

final resultByGameIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, gameId) async {
  final response = await locator<GetResultByGameIdUseCase>().call(params: gameId);

  return response.data!;
});

final resultByPlayerIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, playerId) async {
  final response =
      await locator<GetResultsByPlayerIdUseCase>().call(params: playerId);

  return response.data!;
});

final resultsLoadingProvider = StateProvider<bool>((ref) => false);

final resultsProvider =
    StateNotifierProvider<ResultNotifier, List<ResultModel>>((ref) {
  return ResultNotifier(
    locator<GetResultByGameIdUseCase>(),
    locator<GetLatestResultsUseCase>(),
    ref.read,
  );
});

class ResultNotifier extends StateNotifier<List<ResultModel>> {
  final UseCase getByGameId;
  final UseCase getLatestResults;
  final Reader read;
  ResultNotifier(this.getByGameId, this.getLatestResults, this.read)
      : super([]);

  void fetchAllResults() async {
    _toggleLoading();
    DataState<List<ResultModel>> response = await getLatestResults(params: 30);
    final results = response.data!;
    state = results;

    _toggleLoading();
  }

  void _addResult(ResultModel result) {
    state = [...state, result];
  }

  void _toggleLoading() {
    read(resultsLoadingProvider.notifier).state = !read(resultsLoadingProvider);
  }
}
