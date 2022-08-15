import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/player_select_choice.dart';
import '../../Presentation/widgets/start_game_page/select_player_list.dart';
import '../providers/players_notifier.dart';

class PlayerListPage extends ConsumerWidget {
  final PlayerSelectChoice playerSelectIndex;

  const PlayerListPage({
    Key? key,
    required this.playerSelectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(playersLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SelectPlayerList(
                  playerSelectIndex: playerSelectIndex,
                  players: ref.watch(playersProvider),
                ),
        ],
      ),
    );
  }
}
