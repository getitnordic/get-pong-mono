import '../../../../protos/game.pb.dart';
import '../../../core/common/common.dart';
import '../../clients/clients.dart';

class GetGamesByPlayerIdUseCase
    implements UseCase<DataState<List<GameModel>>, String> {
  final GameRepository service;

  GetGamesByPlayerIdUseCase(this.service);

  @override
  Future<DataState<List<GameModel>>> call({required String params}) async {
    return await service.getGamesByPlayerId(params);
  }
}
