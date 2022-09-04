import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/game.pbgrpc.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/get_games_params.dart';
import '../../domain/use_cases/games/get_games_usecase.dart';

final gamesProvider = StateNotifierProvider<GamesNotifier, List<GameModel>>(
    (ref) => GamesNotifier([], getIt<GetGamesUseCase>(), ref.read));

final gamesLoadingProvider = StateProvider<bool>((ref) => false);

class GamesNotifier extends StateNotifier<List<GameModel>> {
  final UseCase getGamesUseCase;
  final Reader read;
  GamesNotifier(List<GameModel> state, this.getGamesUseCase, this.read)
      : super([]);

  void getAllGames() async {
    _toggleLoading();

    await getGamesUseCase(params: GetGamesParams(offset: 0, limit: 100000))
        .then((value) => {
              if (value is DataSuccess)
                {
                  _toggleLoading(),
                  state = value.data,
                }
              else
                {
                  _toggleLoading(),
                }
            });
    state.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));
  }

  void _toggleLoading() {
    read(gamesLoadingProvider.notifier).state = !read(gamesLoadingProvider);
  }
}
