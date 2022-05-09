import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_avatar.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';

class PlayerList extends StatelessWidget {
  final List players;
  const PlayerList({Key? key, this.players = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return players.isEmpty
        ? const SizedBox.shrink()
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final player = players[index];
                return MyPlayerAvatar(
                    title: player.name, onTap: () => print(player.email));
              },
              itemCount: players.length,
            ),
          );
  }
}
