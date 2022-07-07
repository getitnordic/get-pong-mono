import 'package:flutter/material.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/protos.dart';
import 'package:get_pong/src/presentation/widgets/rankings/player_ranking_list_player.dart';
import 'package:get_pong/src/presentation/widgets/rankings/ranking_sorter.dart';

import '../../../../constants/constants.dart';
import '../../../Presentation/widgets/rankings/player_ranking_list_header.dart';
import '../../../../config/route/route.dart' as route;

class PlayerRankingList extends StatefulWidget {
  final List<PlayerModel> players;
  const PlayerRankingList({Key? key, required this.players}) : super(key: key);

  @override
  State<PlayerRankingList> createState() => _PlayerRankingListState();
}

class _PlayerRankingListState extends State<PlayerRankingList> {
  @override
  Widget build(BuildContext context) {
    final sorter = RankingSorter(widget.players);
    List<PlayerModel> players = widget.players;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(26, 10, 0, 10),
          child: PlayerRankingListHeader(
            onPressedLosses: () {
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.losses);
              });
            },
            onPressedPlayed: () {
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.played);
              });
            },
            onPressedPlayer: () {
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.name);
              });
            },
            onPressedWins: () {
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.wins);
              });
            },
            onPressedScore: () {
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.none);
              });
            },
          ),
        ),
        const Divider(
          height: 3,
          color: ColorConstants.dividerColor,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: players.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  route.profilePage,
                  arguments: players[index],
                ),
                child: PlayerRankingListPlayer(
                  player: players[index],
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
