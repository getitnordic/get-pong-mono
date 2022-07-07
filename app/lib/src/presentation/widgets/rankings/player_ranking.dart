import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/widgets/rankings/player_ranking_list.dart';

import '../../providers/players_notifier.dart';

class PlayerRanking extends ConsumerWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(topRanksProvider);

        return data.when(
          error: (error, stackTrace) => Text('Error $error'),
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 250),
            child: Center(child: CircularProgressIndicator()),
          ),
          data: (data) => PlayerRankingList(
            players: data,
          ),
        );
      },
    );
  }
}
