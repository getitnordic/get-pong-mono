import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_header.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard_list_player.dart';
import 'package:get_pong/src/domain/entities/scoreboard_player.dart';
import 'package:glassmorphism/glassmorphism.dart';

enum SortingOptions {
  highToLow, lowToHigh, none, name, played, wins, losses
}

class ScoreBoard extends StatefulWidget {

  const ScoreBoard({Key? key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {

  final List<ScoreboardPlayer> players = [
    ScoreboardPlayer('Göran', 10, 24),
    ScoreboardPlayer('Erik', 100, 34),
    ScoreboardPlayer('Madonna', 25, 120),
    ScoreboardPlayer('Emma', 245, 78),
    ScoreboardPlayer('Gecko', 50, 50),
    ScoreboardPlayer('Murarn', 8, 20),
    ScoreboardPlayer('Storkrökarn', 32, 32),
    ScoreboardPlayer('Benny', 12, 75),
    ScoreboardPlayer('Lucia', 100, 20),
    ScoreboardPlayer('Vattenmannen', 20, 100),
    ScoreboardPlayer('Ludwig', 85, 44),
    ScoreboardPlayer('Brad Pitt', 78, 25),
    ScoreboardPlayer('Kocken', 65, 45),
    ScoreboardPlayer('Adam', 87, 0),
    ScoreboardPlayer('Woke', 12, 3),
    ScoreboardPlayer('Stefan', 8, 5),
    ScoreboardPlayer('Ann', 71, 25),
  ];

  SortingOptions playedSorted = SortingOptions.none;
  SortingOptions winsSorted = SortingOptions.none;
  SortingOptions lossesSorted = SortingOptions.none;
  SortingOptions namesSorted = SortingOptions.none;

  void sortByPlayedGames(SortingOptions sortingOption) {
    resetSortingOptions();
    if(isHighToLow(sortingOption)) {
      players.sort((a, b) => (a.wins + a.losses).compareTo(b.wins + b.losses));
      playedSorted = SortingOptions.lowToHigh;
    } else {
      players.sort((a, b) => (b.wins + b.losses).compareTo(a.wins + a.losses));
      playedSorted = SortingOptions.highToLow;
    }
  }

  void sortByWins(SortingOptions sortingOption) {
    resetSortingOptions();
    if(isHighToLow(sortingOption)) {
      players.sort((a, b) => a.wins.compareTo(b.wins));
      winsSorted = SortingOptions.lowToHigh;
    } else {
      players.sort((a, b) => b.wins.compareTo(a.wins));
      winsSorted = SortingOptions.highToLow;
    }
  }

  void sortByLosses(SortingOptions sortingOption) {
    resetSortingOptions();
    if(isHighToLow(sortingOption)) {
      players.sort((a, b) => a.losses.compareTo(b.losses));
      lossesSorted = SortingOptions.lowToHigh;
    } else {
      players.sort((a, b) => b.losses.compareTo(a.losses));
      lossesSorted = SortingOptions.highToLow;
    }
  }

  void sortByNames(SortingOptions sortingOption) {
    resetSortingOptions();
    if(isHighToLow(sortingOption)) {
      players.sort((a, b) => b.name.compareTo(a.name));
      namesSorted = SortingOptions.lowToHigh;
    } else {
      players.sort((a, b) => a.name.compareTo(b.name));
      namesSorted = SortingOptions.highToLow;
    }
  }

  bool isHighToLow(SortingOptions sortingOptions) => sortingOptions == SortingOptions.highToLow;

  void resetSortingOptions() {
    winsSorted = SortingOptions.none;
    lossesSorted = SortingOptions.none;
    namesSorted = SortingOptions.none;
    playedSorted = SortingOptions.none;
  }

  @override
  Widget build(BuildContext context) {

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
                    sortByNames(namesSorted);
                  });
                },
                onPressedPlayed: () {
                  setState(() {
                    sortByPlayedGames(playedSorted);
                  });
                },
                onPressedWins: () {
                  setState(() {
                    sortByWins(winsSorted);
                  });
                },
                onPressedLosses: () {
                  setState(() {
                    sortByLosses(lossesSorted);
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
}
