import '../../../../protos/protos.dart';
import '../../../core/common/common.dart';
import '../../repositories/result_repository.dart';

class GetResultByGameIdUseCase
    implements UseCase<DataState<List<ResultModel>>, String> {
  final ResultRepository service;

  GetResultByGameIdUseCase(this.service);

  @override
  Future<DataState<List<ResultModel>>> call({required String params}) async {
    return await service.getResultsByGameId(params);
  }
}
