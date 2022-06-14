import 'package:get_pong/protos/base.pbgrpc.dart';
import 'package:get_pong/src/core/common/data_state.dart';

abstract class PlayerRepository {
  Future<DataState<List<PlayerModel>>> getPlayers();
  Future<DataState<String>> addPlayer(PlayerModel player);
}
