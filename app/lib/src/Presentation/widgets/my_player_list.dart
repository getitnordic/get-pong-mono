import 'package:flutter/material.dart';
import 'package:get_pong/enums/streak_enum.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_avatar.dart';

import '../../../config/route/route.dart' as route;
import '../../domain/entities/player.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;
  final int? pageIndex;
  String? pageTitle;
  List<String> selectedPlayers;
  final Function(String id)? playerAction;
  PlayerList(
      {Key? key,
      this.selectedPlayers = const [],
      this.pageIndex,
      this.playerAction,
      this.pageTitle,
      required this.players})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return players.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final player = players[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            route.profilePage,
                            arguments: players[index],
                          ),
                          child: MyPlayerAvatar(
                            title: player.nickname,
                            withCheckbox: pageIndex == 2 ? false : true,
                            imageUrl: players[index].imageUrl,
                            onTap: () {},
                            onChanged: (bool? value) {
                              if (value == null) {
                                return;
                              }
                              playerAction!(player.id);
                            },
                            isSelected: selectedPlayers.contains(player.id),
                          ),
                        );
                      },
                      itemCount: players.length,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  mapPlayers() {
    return selectedPlayers.map((i) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(i)]));
  }

  getPlayerName(String id) {
    final player1 = players.firstWhere((player) => player.id == id,
        orElse: () => Player(
            DateTime.now().toString(),
            'Player',
            0,
            0,
            'https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg',
            '',
            '',
            '',
            0,
            0,
            StreakEnum.none));
    return player1.nickname;
  }
}
