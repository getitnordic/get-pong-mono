import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../enums/match_type.dart';
import '../../../../protos/base.pb.dart';
import '../../../../register_services.dart';
import '../../../domain/use_cases/games/get_win_probability_usecase.dart';
import 'selected_players_notifier.dart';

final selectedPlayersProvider =
    StateNotifierProvider<SelectedPlayersNotifier, List<PlayerModel>>((ref) =>
        SelectedPlayersNotifier(locator<GetWinProbabilityUseCase>(), ref.read));

final winProbabilityProvider = StateProvider<double>((ref) => 0.0);

final matchTypeProvider = StateProvider<MatchType>((ref) => MatchType.none);
