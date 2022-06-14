import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/src/domain/clients/clients.dart';

class AddPlayer implements UseCase<DataState<String>, PlayerModel> {
  final PlayerRepository service;

  AddPlayer(this.service);

  @override
  Future<DataState<String>> call({required PlayerModel params}) async {
    return await service.addPlayer(params);
  }
}
