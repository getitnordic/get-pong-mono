import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/result.pb.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/results/get_result_by_game_id_usecase.dart';
import '../../domain/use_cases/results/get_results_by_player_id_usecase.dart';


final resultByGameIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, gameId) async {
  final response =
      await locator<GetResultByGameIdUseCase>().call(params: gameId);

  return response.data!;
});

final resultByPlayerIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, playerId) async {
  final response =
      await locator<GetResultsByPlayerIdUseCase>().call(params: playerId);

  return response.data!;
});

