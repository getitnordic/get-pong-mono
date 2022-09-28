import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../protos/base.pb.dart';
import '../../../../register_services.dart';
import '../../../domain/use_cases/players/players.dart';
import 'players_controller.dart';

final playersProvider =
    StateNotifierProvider<PlayersController, List<PlayerModel>>((ref) =>
        PlayersController(
            locator<GetPlayersUseCase>(),
            locator<AddPlayerUseCase>(),
            locator<UpdatePlayerUseCase>(),
            locator<UpdateProfilePictureUseCase>(),
            ref.read));

final playersLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
