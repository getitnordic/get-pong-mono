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
  
  @override
  Future<DataState<List<ResultModel>>> getResultsByPlayerId(String id) async {
     try {
      final request = GetResultsByPlayerIdRequest(playerId: id);

      final response = await client.getResultsByPlayerId(request);
      return DataSuccess(response.resultModels);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<ResultModel>>> getLatestResults(int limit) async {
    try {
      final request = GetResultsRequest(limit: limit);

      final response = await client.getResults(request);
      return DataSuccess(response.resultModel);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }
}
