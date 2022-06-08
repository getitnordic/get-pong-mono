import 'package:flutter/material.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/select_player_list_player.dart';
import 'package:get_pong/src/domain/entities/player.dart';
import 'package:get_pong/config/route/route.dart' as route;

class SelectPlayerList extends StatelessWidget {

  final List<Player> players;
  final PlayerSelectChoice playerSelectIndex;

  const SelectPlayerList({
    Key? key,
    required this.players,
    required this.playerSelectIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                route.profilePage,
                arguments: players[index],
              ),
              child: SelectPlayerListPlayer(
                playerSelectIndex: playerSelectIndex,
                player: players[index],
              ),
            );
          },
          itemCount: players.length,
        ),
      ),
    );
  }
}
