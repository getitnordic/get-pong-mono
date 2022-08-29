import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/results/get_result_by_game_id_usecase.dart';

final resultByGameIdProvider = FutureProvider.family
    .autoDispose<List<ResultModel>, String>((ref, gameId) async {
  final response = await getIt<GetResultByGameIdUseCase>().call(params: gameId);

  return response.data!;
});
