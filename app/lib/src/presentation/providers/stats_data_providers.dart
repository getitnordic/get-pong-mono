import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../core/models/models.dart';
import '../../core/models/stats_page_data.dart';
import '../../domain/use_cases/games/get_games_by_id_usecase.dart';
import '../../domain/use_cases/games/get_games_usecase.dart';
import '../../domain/use_cases/players/players.dart';
import '../../domain/use_cases/results/get_latest_results_usecase.dart';
import '../../domain/use_cases/results/get_results_by_player_id_usecase.dart';

final statsDataProvider = FutureProvider.autoDispose<StatsPageData>(
  (ref) async {
    final results = await locator<GetLatestResultsUseCase>().call(params: 10000000);
    final players =
        await locator<GetPlayersUseCase>().call(params: EmptyParams());
    final games = await locator<GetGamesUseCase>()
        .call(params: GetGamesParams(offset: 0, limit: 100000));

    return StatsPageData(
      results: results.data!,
      players: players.data!,
      games: games.data!,
    );
  },
);

final playerStatsDataProvider =
    FutureProvider.family.autoDispose<StatsPageData, String>(
  (ref, playerId) async {
    final results =
        await locator<GetResultsByPlayerIdUseCase>().call(params: playerId);
    final games =
        await locator<GetGamesByPlayerIdUseCase>().call(params: playerId);

    return StatsPageData(
      results: results.data!,
      players: [],
      games: games.data!,
    );
  },
);
