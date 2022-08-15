import '../../../protos/base.pbgrpc.dart';
import '../../core/common/data_state.dart';

abstract class PlayerRepository {
  Future<DataState<List<PlayerModel>>> getPlayers();
  Future<DataState<String>> addPlayer(PlayerModel player);
  Future<DataState<PlayerModel>> updatePlayer(PlayerModel player);
}
