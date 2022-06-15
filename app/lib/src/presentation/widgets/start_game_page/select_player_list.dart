import 'package:flutter/material.dart';
import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/select_player_list_player.dart';

import '../../../../constants/color_constants.dart';

class SelectPlayerList extends StatefulWidget {
  final PlayerSelectChoice playerSelectIndex;
  final List<PlayerModel> players;

  const SelectPlayerList(
      {Key? key, required this.playerSelectIndex, required this.players})
      : super(key: key);

  @override
  State<SelectPlayerList> createState() => _SelectPlayerListState();
}

class _SelectPlayerListState extends State<SelectPlayerList> {
  List<PlayerModel> players = [];

  @override
  void initState() {
    players.addAll(widget.players);
    super.initState();
  }

  void filterPlayers(String query) {
    if (query.isNotEmpty) {
      for (final p in widget.players) {
        if (p.firstName.isNotEmpty) {
          if (p.firstName.toLowerCase().contains(query.toLowerCase())) {
            players.add(p);
          }
        }
        if (p.lastName.isNotEmpty) {
          if (p.lastName.toLowerCase().contains(query.toLowerCase())) {
            players.add(p);
          }
        }
        if (p.nickname.isNotEmpty) {
          if (p.nickname.toLowerCase().contains(query.toLowerCase())) {
            players.add(p);
          }
        }
      }
    } else {
      players = widget.players;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: TextField(
              onChanged: (value) => setState(() {
                filterPlayers(value);
              }),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search, color: ColorConstants.formColor),
              ),
            ),
          ),
          Expanded(
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
                      playerSelectIndex: widget.playerSelectIndex,
                      player: players[index],
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
}
