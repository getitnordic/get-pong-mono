import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../protos/game.pb.dart';
import '../../../../register_services.dart';
import '../../../domain/use_cases/games/games.dart';
import '../../../domain/use_cases/games/get_games_by_id_usecase.dart';
import 'games_notifier.dart';

final gamesProvider = StateNotifierProvider<GamesNotifier, List<GameModel>>(
  (ref) => GamesNotifier(
    locator<GetGamesUseCase>(),
    locator<GetGamesByPlayerIdUseCase>(),
    locator<SaveGameUseCase>(),
    ref.read,
  ),
);

final gamesByPlayerIdProvider = FutureProvider.family
    .autoDispose<List<GameModel>, String>((ref, playerId) async {
  return ref.watch(gamesProvider.notifier).getMatchesByPlayerId(playerId);
});

final fetchGamesProvider = FutureProvider.autoDispose<bool>((ref) async {
  return ref.watch(gamesProvider.notifier).fetchAllGames();
});

final fetchTenGamesProvider = FutureProvider.autoDispose<List<GameModel>>((ref) async {
  return ref.watch(gamesProvider.notifier).getNextTenGames(0);
});
