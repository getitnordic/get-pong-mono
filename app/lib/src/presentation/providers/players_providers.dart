import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../../protos/base.pb.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/players/players.dart';
import '../controllers/players_controller.dart';

final playersProvider =
    StateNotifierProvider<PlayersController, List<PlayerModel>>((ref) =>
        PlayersController(
            locator<GetPlayersUseCase>(),
            locator<AddPlayerUseCase>(),
            locator<UpdatePlayerUseCase>(),
            locator<UpdateProfilePictureUseCase>(),
            ref.read));

final playerListProvider = FutureProvider.autoDispose<List<PlayerModel>>((ref) async {
  final players =
      await locator<GetPlayersUseCase>().call(params: EmptyParams());
  return players.data!;
});

final playersLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
