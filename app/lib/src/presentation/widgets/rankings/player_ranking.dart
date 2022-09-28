import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/players/players_providers.dart';
import 'player_ranking_list.dart';

class PlayerRanking extends ConsumerWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   

    return PlayerRankingList();
  }
}
