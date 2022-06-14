import 'package:get_pong/protos/base.pbgrpc.dart';
import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/src/domain/clients/clients.dart';

class GetPlayers implements UseCase<DataState<List<PlayerModel>>, EmptyParams> {
  final PlayerRepository service;

  GetPlayers(this.service);

  @override
  Future<DataState<List<PlayerModel>>> call(
      {required EmptyParams params}) async {
    return await service.getPlayers();
  }
}
