import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/base.pb.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/players/get_players_usecase.dart';
import '../controllers/top_ranks_controller.dart';

final topRanksProvider =
    StateNotifierProvider.autoDispose<TopRanksController, List<PlayerModel>>(
        (ref) => TopRanksController(locator<GetPlayersUseCase>(), ref.read));

final topRanksLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
