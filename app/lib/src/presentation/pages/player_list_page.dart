import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/select_player_list.dart';
import '../providers/providers.dart';

class PlayerListPage extends ConsumerWidget {
  final PlayerSelectChoice playerSelectIndex;

  const PlayerListPage({
    Key? key,
    required this.playerSelectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(playersLoadingProvider);
    final players = ref.watch(playersProvider);

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
                  players: players,
                ),
        ],
      ),
    );
  }
}
