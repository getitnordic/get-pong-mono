import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/scoreboard_players_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_header.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_player.dart';
import 'package:get_pong/src/domain/entities/scoreboard_player.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:get_pong/src/util/sorting_options.dart';

class ScoreBoard extends ConsumerStatefulWidget {

  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends ConsumerState<ScoreBoard> {

  SortingOptions pressedLast = SortingOptions.none;
  bool highToLow = true;

  @override
  Widget build(BuildContext context) {

    final List<ScoreboardPlayer> players = ref.read(scoreboardPlayerProvider);

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
                onPressedPlayer: () {
                  setState(() {
                    sortByName();
                  });
                },
                onPressedPlayed: () {
                  setState(() {
                    sortByPlayed();
                  });
                },
                onPressedWins: () {
                  setState(() {
                    sortByWins();
                  });
                },
                onPressedLosses: () {
                  setState(() {
                    sortByLosses();
                  });
                },
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

  void toggleHighToLow() {
    highToLow = !highToLow;
  }

  void sortByLosses() {
    if(pressedLast != SortingOptions.losses) {
      highToLow = true;
    }
    ref.read(scoreboardPlayerProvider.notifier)
        .sortPlayerList(SortingOptions.losses, highToLow);
    pressedLast = SortingOptions.losses;
    toggleHighToLow();
  }

  void sortByWins() {
    if(pressedLast != SortingOptions.wins) {
      highToLow = true;
    }
    ref.read(scoreboardPlayerProvider.notifier)
        .sortPlayerList(SortingOptions.wins, highToLow);
    pressedLast = SortingOptions.wins;
    toggleHighToLow();
  }

  void sortByName() {
    if(pressedLast != SortingOptions.name) {
      highToLow = true;
    }
    ref.read(scoreboardPlayerProvider.notifier)
        .sortPlayerList(SortingOptions.name, highToLow);
    pressedLast = SortingOptions.name;
    toggleHighToLow();
  }

  void sortByPlayed() {
    if(pressedLast != SortingOptions.played) {
      highToLow = true;
    }
    ref.read(scoreboardPlayerProvider.notifier)
        .sortPlayerList(SortingOptions.played, highToLow);
    pressedLast = SortingOptions.played;
    toggleHighToLow();
  }
}
