import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_avatar.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';
import 'package:get_pong/src/presentation/widgets/my_playerList_header.dart';
import 'package:get_pong/src/presentation/widgets/my_vs_devider.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:uuid/uuid.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;
  final int? pageIndex;
  final String listTitle;
  List<String> selectedPlayers;
  final Function(String id)? playerAction;
  PlayerList(
      {Key? key,
      required this.players,
      this.selectedPlayers = const [],
      this.pageIndex,
      this.playerAction,
      required this.listTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final selectedPlayers = ['1'];

    return players.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlassmorphicContainer(
              height: double.infinity,
              width: double.infinity,
              borderRadius: 20,
              blur: 20,
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              border: 0.5,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: Column(
                children: [
                  PlayerListHeader(
                      title: listTitle,
                      addButton: pageIndex == 0 ? false : true),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final player = players[index];
                          return MyPlayerAvatar(
                            title: player.name,
                            withCheckbox: pageIndex == 2 ? false : true,
                            onTap: () {},
                            onChanged: (bool? value) {
                              if (value == null) {
                                return;
                              }
                              playerAction!(player.id);
                            },
                            isSelected: selectedPlayers.contains(player.id),
                          );
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
                        child: pageIndex == 2
                            ? null
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 30.0),
                                    child: Text(
                                        selectedPlayers.length == 0
                                            ? ''
                                            : getPlayerName(selectedPlayers[0]),
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  Expanded(child: MyVsDevider()),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0, right: 20),
                                    child: Text(
                                      selectedPlayers.length < 2
                                          ? ''
                                          : getPlayerName(selectedPlayers[1]),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Column(
                                  //     children: [...mapPlayers()],
                                  //   ),
                                  // )
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
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
        orElse: () => Player(
            name: 'player',
            email: 'user@example.com',
            id: Uuid().v4().toString()));
    return player1.name;
  }
}
