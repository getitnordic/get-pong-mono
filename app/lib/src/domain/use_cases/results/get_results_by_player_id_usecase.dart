import '../../../../protos/protos.dart';
import '../../../core/common/common.dart';
import '../../clients/result_repository.dart';

class GetResultsByPlayerIdUseCase
    implements UseCase<DataState<List<ResultModel>>, String> {
  final ResultRepository service;

  GetResultsByPlayerIdUseCase(this.service);

  @override
  Future<DataState<List<ResultModel>>> call({required String params}) async {
    return await service.getResultsByPlayerId(params);
  }
}
