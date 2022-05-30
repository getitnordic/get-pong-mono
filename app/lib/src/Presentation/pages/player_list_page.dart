import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_list.dart';
import 'package:get_pong/src/domain/entities/player.dart';
import 'package:get_pong/src/presentation/widgets/my_add_player_form.dart';

class PlayerListPage extends ConsumerWidget {
  final Object? arguments;

  const PlayerListPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<Player> playerList = ref.watch(playersProvider);

    int pageIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetPong',
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: PlayerList(
                players: playerList,
                pageIndex: pageIndex,
                listTitle: 'All players',
                pageTitle: 'Player List',
              ),
          ),
          const Text(
            'Add player',
            style: TextStyle(color: Colors.white70, fontSize: 20),
          ),
          const AddPlayerFields(),
        ],
      ),
    );
  }
}
