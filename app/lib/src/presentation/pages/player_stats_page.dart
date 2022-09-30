import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/providers/stats_data_providers.dart';

import '../../../protos/protos.dart';

import '../controllers/player_stats_controller.dart';
import '../widgets/stats_page/recent_stats_player.dart';

class PlayerStatsPage extends ConsumerWidget {
  final PlayerModel player;
  const PlayerStatsPage({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchPlayerStats = ref.watch(playerStatsDataProvider(player.id));
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Last 30 days.')),
      ),
      body: fetchPlayerStats.when(
            data: (data) {
              return RecentStatsPlayer(
                statsController: PlayerStatsController(
                  player: player,
                  results: data.results,
                  games: data.games,
                ),
              );
            },
            error: ((error, stackTrace) => Text('Error: $error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
