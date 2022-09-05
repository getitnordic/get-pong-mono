import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/domain/use_cases/games/get_games_by_id_usecase.dart';

import '../../../protos/game.pbgrpc.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/get_games_params.dart';
import '../../domain/use_cases/games/get_games_usecase.dart';

final gamesProvider = StateNotifierProvider<GamesNotifier, List<GameModel>>(
  (ref) => GamesNotifier(
    [],
    getIt<GetGamesUseCase>(),
    getIt<GetGamesByPlayerIdUseCase>(),
    ref.read,
  ),
);

final gamesLoadingProvider = StateProvider<bool>((ref) => false);

final gamesByPlayerIdProvider = FutureProvider.family
    .autoDispose<List<GameModel>, String>((ref, playerId) async {
  return ref.watch(gamesProvider.notifier).getMatchesByPlayerId(playerId);
});

class GamesNotifier extends StateNotifier<List<GameModel>> {
  final UseCase getGamesUseCase;
  final UseCase getGamesByPlayerIdUseCase;
  final Reader read;
  GamesNotifier(
    List<GameModel> state,
    this.getGamesUseCase,
    this.getGamesByPlayerIdUseCase,
    this.read,
  ) : super([]);

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

  Future<List<GameModel>> getMatchesByPlayerId(String id) async {
    List<GameModel> matches = [];

    await getGamesByPlayerIdUseCase(params: id).then((value) => {
          if (value is DataSuccess)
            {
              matches = value.data!,
            }
        });
    matches.sort(
        (a, b) => b.timeStamp.toDateTime().compareTo(a.timeStamp.toDateTime()));

    return matches;
  }

  void _toggleLoading() {
    read(gamesLoadingProvider.notifier).state = !read(gamesLoadingProvider);
  }
}
