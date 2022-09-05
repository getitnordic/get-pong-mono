import '../../../protos/protos.dart';
import '../../core/common/common.dart';

abstract class ResultRepository {
  Future<DataState<List<ResultModel>>> getResultsByGameId(String id);
}