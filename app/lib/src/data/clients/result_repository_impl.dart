import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

import '../../../protos/protos.dart';
import '../../core/common/data_state.dart';
import '../../domain/clients/result_repository.dart';

class ResultRepositoryImpl implements ResultRepository {
  final ResultServiceClient client;

  ResultRepositoryImpl(this.client);

  @override
  Future<DataState<List<ResultModel>>> getResultsByGameId(String id) async {
    try {
      final request = GetResultByGameIdRequest(gameId: id);

      final response = await client.getResultByGameId(request);
      return DataSuccess(response.resultModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }
}
