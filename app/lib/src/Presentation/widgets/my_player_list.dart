import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/custom_container.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_avatar.dart';
import 'package:get_pong/src/presentation/widgets/my_playerList_header.dart';
import 'package:get_pong/src/presentation/widgets/my_vs_devider.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../config/route/route.dart' as route;
import '../../domain/entities/player.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;
  final int? pageIndex;
  final String listTitle;
  String? pageTitle;
  List<String> selectedPlayers;
  final Function(String id)? playerAction;
  PlayerList(
      {Key? key,
        this.selectedPlayers = const [],
        this.pageIndex,
        this.playerAction,
        this.pageTitle,
        required this.listTitle,
        required this.players})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final selectedPlayers = ['1'];

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
                            arguments: {
                              'name': players[index].name,
                              'gamesWon': players[index].wins.toString(),
                              'gamesLost': players[index].losses.toString(),
                              'imageUrl': players[index].imageUrl
                            },
                          ),
                          child: MyPlayerAvatar(
                            title: player.name,
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

    // : Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Colors.grey,
    //       ),
    //       child: Column(
    //         children: [
    //           PlayerListHeader(
    //               title: listTitle,
    //               addButton: pageIndex == 0 ? false : true),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: ListView.builder(
    //               itemBuilder: (context, index) {
    //                 final player = players[index];
    //                 return MyPlayerAvatar(
    //                     title: player.name,
    //                     withCheckbox: pageIndex == 2 ? false : true,
    //                     onTap: () => print(player.email));
    //               },
    //               itemCount: players.length,
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Padding(
    //             padding: const EdgeInsets.only(bottom: 16.0),
    //             child: Container(
    //               child: pageIndex == 2
    //                   ? null
    //                   : Row(
    //                       mainAxisAlignment:
    //                           MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(
    //                               left: 8.0, right: 16.0),
    //                           child: Text('player1'),
    //                         ),
    //                         Expanded(child: MyVsDevider()),
    //                         Padding(
    //                           padding: const EdgeInsets.only(
    //                               left: 16.0, right: 8.0),
    //                           child: Text('player2'),
    //                         ),
    //                       ],
    //                     ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  mapPlayers() {
    return selectedPlayers.map((i) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(i)]));
  }

  getPlayerName(String id) {
    final player1 = players.firstWhere((player) => player.id == id,
        orElse: () => Player(DateTime.now().toString(), 'Player', 0, 0, 'https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg'));
    return player1.name;
  }
}
