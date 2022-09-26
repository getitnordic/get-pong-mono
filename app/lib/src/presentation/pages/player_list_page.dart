import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/player_select_choice.dart';
import '../../Presentation/widgets/start_game_page/select_player_list.dart';
import '../providers/players/players_providers.dart';

class PlayerListPage extends ConsumerWidget {
  final PlayerSelectChoice playerSelectIndex;

  const PlayerListPage({
    Key? key,
    required this.playerSelectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchPlayers = ref.read(fetchPlayersProvider);
    final players = ref.read(playersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fetchPlayers.when(
            data: (_) {
              return SelectPlayerList(
                playerSelectIndex: playerSelectIndex,
                players: players,
              );
            },
            error: ((error, stackTrace) => Text('Error: $error')),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
