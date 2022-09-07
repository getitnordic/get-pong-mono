import '../../../../protos/protos.dart';
import '../../../core/common/common.dart';
import '../../clients/result_repository.dart';

class GetLatestResultsUseCase
    implements UseCase<DataState<List<ResultModel>>, int> {
  final ResultRepository service;

  GetLatestResultsUseCase(this.service);

  @override
  Future<DataState<List<ResultModel>>> call({required int params}) async {
    return await service.getLatestResults(params);
  }
}
