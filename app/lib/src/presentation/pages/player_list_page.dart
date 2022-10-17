import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/constants.dart';

import '../../../enums/player_select_choice.dart';
import '../../Presentation/widgets/start_game_page/select_player_list.dart';
import '../providers/players_providers.dart';

class PlayerListPage extends ConsumerWidget {
  final PlayerSelectChoice playerSelectIndex;

  const PlayerListPage({
    Key? key,
    required this.playerSelectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
      ),
      body: players.when(
        data: (players) {
          return Column(children: [
            SelectPlayerList(
              playerSelectIndex: playerSelectIndex,
              players: players,
            ),
          ]);
        },
        error: (error, stackTrace) => const Text(
          'Something went wrong, try again.',
          style: TextStyle(
            color: ColorConstants.textColor,
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
