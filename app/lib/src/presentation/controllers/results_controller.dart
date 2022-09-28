import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../core/common/common.dart';

class ResultsController extends StateNotifier<List<ResultModel>> {
  final UseCase getByGameId;
  final UseCase getLatestResults;
  final Reader read;
  ResultsController(this.getByGameId, this.getLatestResults, this.read)
      : super([]);

  void fetchAllResults() async {
    DataState<List<ResultModel>> response = await getLatestResults(params: 30);
    final results = response.data!;
    state = results;
  }

  void _addResult(ResultModel result) {
    state = [...state, result];
  }
}
