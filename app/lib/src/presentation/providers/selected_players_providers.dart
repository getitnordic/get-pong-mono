import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/match_type.dart';
import '../../../protos/base.pb.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/games/get_win_probability_usecase.dart';
import '../controllers/selected_players_controller.dart';

final selectedPlayersProvider =
    StateNotifierProvider.autoDispose<SelectedPlayersController, List<PlayerModel>>((ref) =>
        SelectedPlayersController(
            locator<GetWinProbabilityUseCase>(), ref.read));

final winProbabilityProvider = StateProvider.autoDispose<double>((ref) => 0.0);

final matchTypeProvider = StateProvider<MatchType>((ref) => MatchType.none);
