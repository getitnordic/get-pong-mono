import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stats_data_providers.dart';
import '../widgets/stats_page/recent_stats_overall.dart';
import '../controllers/result_stats_controller.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(statsDataProvider).when(
          data: (data) {
            return RecentStatsOverall(
              statsController: ResultStatsController(
                results: data.results,
                players: data.players,
                games: data.games,
              ),
            );
          },
          error: ((error, stackTrace) => Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
