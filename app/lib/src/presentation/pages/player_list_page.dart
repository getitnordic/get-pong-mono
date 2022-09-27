import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/player_select_choice.dart';
import '../../Presentation/providers/app_loading_provider.dart';
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
    final players = ref.read(playersProvider);
    final isLoading = ref.watch(appLoadingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
      ),
      body: Column(
        children: [
          isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SelectPlayerList(
              playerSelectIndex: playerSelectIndex,
              players: players,
            ),
        ],
      ),
    );
  }
}
