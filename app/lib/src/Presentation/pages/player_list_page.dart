import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/widgets/my_add_player_form.dart';
import 'package:get_pong/src/presentation/widgets/my_player_list.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';

class PlayerListPage extends ConsumerWidget {
  final Object? arguments;

  const PlayerListPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> playerList = ref.watch(playerProvider);

    print(playerList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetPong'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text(
            'playerListPage',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Expanded(child: PlayerList(players: playerList)),
          Text(
            'Add player',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          AddPlayerFields(),
        ],
      ),
    );
  }
}
