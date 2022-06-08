import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/rankings/player_ranking_list_header.dart';
import 'package:get_pong/src/Presentation/widgets/rankings/player_ranking_list_player.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../enums/sorting_options.dart';
import '../../../domain/entities/player.dart';
import '../../providers/players_notifier.dart';

class PlayerRanking extends ConsumerWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Player> players = ref.watch(playersProvider);
    final SortingOptions lastPressed = ref.watch(rankingPressedLastProvider);
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

    void sortByLosses() {
      if (lastPressed != SortingOptions.losses) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.losses, highToLow);
      setLastPressed(SortingOptions.losses);
      toggleHighToLow();
    }

    void sortByWins() {
      if (lastPressed != SortingOptions.wins) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.wins, highToLow);
      setLastPressed(SortingOptions.wins);
      toggleHighToLow();
    }

    void sortByName() {
      if (lastPressed != SortingOptions.name) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.name, highToLow);
      setLastPressed(SortingOptions.name);
      toggleHighToLow();
    }

    void sortByPlayed() {
      if (lastPressed != SortingOptions.played) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.played, highToLow);
      setLastPressed(SortingOptions.played);
      toggleHighToLow();
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          PlayerRankingListHeader(
            onPressedPlayer: sortByName,
            onPressedPlayed: sortByPlayed,
            onPressedWins: sortByWins,
            onPressedLosses: sortByLosses,
          ),
          const Divider(
            height: 3,
            color: Colors.white,
          ),
          Flexible(
            child: ListView.builder(
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
                }),
          ),
        ],
      ),
    );
  }
}
