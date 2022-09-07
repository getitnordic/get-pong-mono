import '../../../core/common/common.dart';
import '../../../core/models/get_win_probability_params.dart';
import '../../clients/game_repository.dart';

class GetWinProbabilityUseCase implements UseCase<DataState<double>, GetWinProbabilityParams> {
  final GameRepository service;

  GetWinProbabilityUseCase(this.service);
  
  @override
  Future<DataState<double>> call({required GetWinProbabilityParams params}) async {
    return await service.getWinProbability(params);
  }
  
  
 

  
}
