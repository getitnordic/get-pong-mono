import '../../../../protos/protos.dart';
import '../../../core/common/common.dart';
import '../../clients/clients.dart';

class UpdatePlayerUseCase
    implements UseCase<DataState<PlayerModel>, PlayerModel> {
  final PlayerRepository service;

  UpdatePlayerUseCase(this.service);

  @override
  Future<DataState<PlayerModel>> call({required PlayerModel params}) async {
    return await service.updatePlayer(params);
  }
}
