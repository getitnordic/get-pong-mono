import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_header.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_player.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../domain/entities/scoreboard_player.dart';
import '../../util/sorting_options.dart';
import '../providers/scoreboard_players_notifier.dart';

class ScoreBoard extends ConsumerWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ScoreboardPlayer> players = ref.watch(scoreboardPlayerProvider);
    final SortingOptions lastPressed = ref.watch(scoreboardPressedLastProvider);
    bool highToLow = ref.watch(scoreboardSortingTypeProvider);

    void toggleHighToLow() {
      highToLow ?
        ref.watch(scoreboardSortingTypeProvider.notifier).update((state) => false):
        ref.watch(scoreboardSortingTypeProvider.notifier).update((state) => true);
    }

    void setLastPressed(SortingOptions option) {
      ref.watch(scoreboardPressedLastProvider.notifier).update((state) => option);
    }

    void sortByLosses() {
      if(lastPressed != SortingOptions.losses) {
        highToLow = true;
      }
      ref.watch(scoreboardPlayerProvider.notifier)
          .sortPlayerList(SortingOptions.losses, highToLow);
      setLastPressed(SortingOptions.losses);
      toggleHighToLow();
    }

    void sortByWins() {
      if(lastPressed != SortingOptions.wins) {
        highToLow = true;
      }
      ref.watch(scoreboardPlayerProvider.notifier)
          .sortPlayerList(SortingOptions.wins, highToLow);
      setLastPressed(SortingOptions.wins);
      toggleHighToLow();
    }

    void sortByName() {
      if(lastPressed != SortingOptions.name) {
        highToLow = true;
      }
      ref.watch(scoreboardPlayerProvider.notifier)
          .sortPlayerList(SortingOptions.name, highToLow);
      setLastPressed(SortingOptions.name);
      toggleHighToLow();
    }

    void sortByPlayed() {
      if(lastPressed != SortingOptions.played) {
        highToLow = true;
      }
      ref.watch(scoreboardPlayerProvider.notifier)
          .sortPlayerList(SortingOptions.played, highToLow);
      setLastPressed(SortingOptions.played);
      toggleHighToLow();
    }


    return Container(
      padding: const EdgeInsets.all(8),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: double.infinity,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: Column(
          children: [
            ScoreboardListHeader(
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
                    return ScoreboardListPlayer(
                      player: players[index],
                      index: index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
