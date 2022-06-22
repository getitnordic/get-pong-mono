import 'package:get_pong/protos/protos.dart';
import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/src/domain/clients/clients.dart';

class UpdatePlayerUseCase
    implements UseCase<DataState<PlayerModel>, PlayerModel> {
  final PlayerRepository service;

  UpdatePlayerUseCase(this.service);

  @override
  Future<DataState<PlayerModel>> call({required PlayerModel params}) async {
    return await service.updatePlayer(params);
  }
}
