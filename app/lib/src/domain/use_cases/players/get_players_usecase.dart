import '../../../../protos/base.pbgrpc.dart';
import '../../../core/common/common.dart';
import '../../repositories/repositories.dart';

class GetPlayersUseCase
    implements UseCase<DataState<List<PlayerModel>>, EmptyParams> {
  final PlayerRepository service;

  GetPlayersUseCase(this.service);

  @override
  Future<DataState<List<PlayerModel>>> call(
      {required EmptyParams params}) async {
    return await service.getPlayers();
  }
}
