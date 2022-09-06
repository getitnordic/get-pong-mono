import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../providers/games_notifier.dart';
import '../providers/result_notifier.dart';
import '../widgets/stats_page/player_stats_controller.dart';
import '../widgets/stats_page/recent_stats_player.dart';

class PlayerStatsPage extends ConsumerWidget {
  final PlayerModel player;
  const PlayerStatsPage({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(resultByPlayerIdProvider.call(player.id));
    final games = ref.watch(gamesByPlayerIdProvider.call(player.id));

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Last 30 days.')),
      ),
      body: results.when(
        data: (results) => games.when(
            data: (games) => RecentStatsPlayer(
                  statsController: PlayerStatsController(
                    player: player,
                    results: results,
                    games: games,
                  ),
                ),
            error: ((error, stackTrace) => Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator())),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
