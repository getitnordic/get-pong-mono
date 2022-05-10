import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_avatar.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';
import 'package:get_pong/src/presentation/widgets/my_playerList_header.dart';
import 'package:get_pong/src/presentation/widgets/my_vs_devider.dart';

class PlayerList extends StatelessWidget {
  final List players;
  const PlayerList({Key? key, this.players = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return players.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  PlayerListHeader(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final player = players[index];
                          return MyPlayerAvatar(
                              title: player.name,
                              onTap: () => print(player.email));
                        },
                        itemCount: players.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 16.0),
                              child: Text('player1'),
                            ),
                            Expanded(child: MyVsDevider()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8.0),
                              child: Text('player2'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
