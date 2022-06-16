import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../clients/game_repository.dart';

class SaveGameUseCase implements UseCase<DataState<String>, GameModel> {
  final GameRepository service;

  SaveGameUseCase(this.service);

  @override
  Future<DataState<String>> call({required GameModel params}) async {
    return await service.saveGame(params);
  }
}
