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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ref.watch(fetchPlayersProvider).when(
                data: (_) {
                  return SelectPlayerList(
                    playerSelectIndex: playerSelectIndex,
                    players: ref.watch(playersProvider),
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
