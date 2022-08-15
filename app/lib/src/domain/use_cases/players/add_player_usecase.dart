import '../../../../protos/base.pb.dart';
import '../../../core/common/common.dart';
import '../../clients/clients.dart';

class AddPlayerUseCase implements UseCase<DataState<String>, PlayerModel> {
  final PlayerRepository service;

  AddPlayerUseCase(this.service);

  @override
  Future<DataState<String>> call({required PlayerModel params}) async {
    return await service.addPlayer(params);
  }
}
