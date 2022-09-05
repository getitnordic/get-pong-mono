import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/all_players_notifier.dart';
import '../providers/games_notifier.dart';
import '../providers/result_notifier.dart';
import '../widgets/stats_page/recent_stats_overall.dart';
import '../widgets/stats_page/result_stats_controller.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(resultsLoadingProvider)
        ? const Center(child: CircularProgressIndicator())
        : RecentStatsOverall(
            statsController: ResultStatsController(
              results: ref.watch(resultsProvider),
              players: ref.watch(allPlayersNewProvider),
              games: ref.watch(gamesProvider),
            ),
          );
  }
}
