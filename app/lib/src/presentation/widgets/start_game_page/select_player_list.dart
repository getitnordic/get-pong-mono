import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/color_constants.dart';
import '../../../../enums/player_select_choice.dart';
import '../../../../protos/base.pb.dart';
import '../../controllers/selected_players_controller.dart';
import '../../providers/selected_players_providers.dart';
import 'select_player_list_player.dart';

class SelectPlayerList extends ConsumerStatefulWidget {
  final PlayerSelectChoice playerSelectIndex;
  final List<PlayerModel> players;
  const SelectPlayerList({
    Key? key,
    required this.playerSelectIndex,
    required this.players,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectPlayerListState();
}

class _SelectPlayerListState extends ConsumerState<SelectPlayerList> {
  List<PlayerModel> players = [];
  List<PlayerModel> originalPlayers = [];

  @override
  void initState() {
    players = widget.players;
    originalPlayers = widget.players;
    super.initState();
  }

  void filterPlayers(String query) {
    if (query.isNotEmpty) {
      players = originalPlayers
          .where((p) => p.fullName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      players = originalPlayers;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final selectedPlayersController =
        ref.read(selectedPlayersProvider.notifier);

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: SizedBox(
              height: 50,
              child: TextField(
                onChanged: (value) => setState(() {
                  filterPlayers(value);
                }),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon:
                      Icon(Icons.search, color: ColorConstants.formColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isPhoneOrVertical
                  ? PlayerGridView(
                      players: players,
                      controller: selectedPlayersController,
                      playerSelectIndex: widget.playerSelectIndex,
                    )
                  : PlayerGridView(
                      players: players,
                      controller: selectedPlayersController,
                      playerSelectIndex: widget.playerSelectIndex,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerGridView extends StatelessWidget {
  final List<PlayerModel> players;
  final SelectedPlayersController controller;
  final PlayerSelectChoice playerSelectIndex;

  const PlayerGridView(
      {Key? key,
      required this.players,
      required this.controller,
      required this.playerSelectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.setPlayer(
              player: players[index],
              playerSelectChoice: playerSelectIndex,
            );
            Navigator.of(context).pop();
          },
          child: SelectPlayerListPlayer(player: players[index]),
        );
      },
    );
  }
}

class PlayerListView extends StatelessWidget {
  final List<PlayerModel> players;
  final SelectedPlayersController controller;
  final PlayerSelectChoice playerSelectIndex;

  const PlayerListView(
      {Key? key,
      required this.players,
      required this.controller,
      required this.playerSelectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.setPlayer(
              player: players[index],
              playerSelectChoice: playerSelectIndex,
            );
            Navigator.of(context).pop();
          },
          child: SelectPlayerListPlayer(player: players[index]),
        );
      },
      itemCount: players.length,
    );
  }
}
