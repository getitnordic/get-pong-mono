import 'package:get_pong/src/core/models/update_profile_picture_params.dart';

import '../../../protos/base.pbgrpc.dart';
import '../../core/common/data_state.dart';

abstract class PlayerRepository {
  Future<DataState<List<PlayerModel>>> getPlayers();
  Future<DataState<String>> addPlayer(PlayerModel player);
  Future<DataState<PlayerModel>> updatePlayer(PlayerModel player);
  Future<DataState<String>> updateProfilePicture(
      UpdateProfilePictureParams params);
}
