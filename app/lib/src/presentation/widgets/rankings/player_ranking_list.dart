import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/protos.dart';
import 'package:get_pong/src/presentation/widgets/rankings/player_ranking_list_player.dart';
import 'package:get_pong/src/presentation/widgets/rankings/ranking_sorter.dart';

import '../../../../constants/constants.dart';
import '../../../Presentation/widgets/rankings/player_ranking_list_header.dart';
import '../../../../config/route/route.dart' as route;
import '../../providers/ranking_provider.dart';

class PlayerRankingList extends ConsumerStatefulWidget {
  final List<PlayerModel> players;
  const PlayerRankingList({
    Key? key,
    required this.players,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerRankingListState();
}

class _PlayerRankingListState extends ConsumerState<PlayerRankingList> {
  @override
  Widget build(BuildContext context) {
    final sorter = RankingSorter(widget.players);
    final lastPressed = ref.watch(rankingPressedLastProvider);
    List<PlayerModel> players = widget.players;
    bool highToLow = ref.watch(rankingSortingTypeProvider);

    void toggleHighToLow() {
      highToLow
          ? ref
              .watch(rankingSortingTypeProvider.notifier)
              .update((state) => false)
          : ref
              .watch(rankingSortingTypeProvider.notifier)
              .update((state) => true);
    }

    void setLastPressed(SortingOptions option) {
      ref.watch(rankingPressedLastProvider.notifier).update((state) => option);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(26, 10, 0, 10),
          child: PlayerRankingListHeader(
            onPressedLosses: () {
              if (lastPressed != SortingOptions.losses) {
                highToLow = true;
              }
              setState(() {
                players =
                    sorter.sortPlayerList(SortingOptions.losses, highToLow);
              });
              setLastPressed(SortingOptions.losses);
              toggleHighToLow();
            },
            onPressedPlayed: () {
              if (lastPressed != SortingOptions.played) {
                highToLow = true;
              }
              setState(() {
                players =
                    sorter.sortPlayerList(SortingOptions.played, highToLow);
              });
              setLastPressed(SortingOptions.played);
              toggleHighToLow();
            },
            onPressedPlayer: () {
              if (lastPressed != SortingOptions.name) {
                highToLow = true;
              }
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.name, highToLow);
              });
              setLastPressed(SortingOptions.name);
              toggleHighToLow();
            },
            onPressedWins: () {
              if (lastPressed != SortingOptions.wins) {
                highToLow = true;
              }
              setState(() {
                players = sorter.sortPlayerList(SortingOptions.wins, highToLow);
              });
              setLastPressed(SortingOptions.wins);
              toggleHighToLow();
            },
            onPressedScore: () {
              if (lastPressed != SortingOptions.score) {
                highToLow = true;
              }
              setState(() {
                players =
                    sorter.sortPlayerList(SortingOptions.score, highToLow);
              });
              setLastPressed(SortingOptions.score);
              toggleHighToLow();
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
