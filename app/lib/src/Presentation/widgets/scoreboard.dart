import 'package:flutter/material.dart';
import 'package:get_pong/src/domain/entities/scoreboard_player.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

enum SortingOptions {
  highToLow, lowToHigh, none
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

  SortingOptions playedSorted = SortingOptions.highToLow;
  SortingOptions winsSorted = SortingOptions.none;
  SortingOptions lossesSorted = SortingOptions.none;
  SortingOptions namesSorted = SortingOptions.none;

  void sortByPlayedGames(SortingOptions sortingOption) {
    if(isLowToHighOrNone(sortingOption)) {
      players.sort((a, b) => (b.wins + b.losses).compareTo(a.wins + a.losses));
      playedSorted = SortingOptions.highToLow;
    } else {
      players.sort((a, b) => (a.wins + a.losses).compareTo(b.wins + b.losses));
      playedSorted = SortingOptions.lowToHigh;
    }
    winsSorted = SortingOptions.none;
    lossesSorted = SortingOptions.none;
    namesSorted = SortingOptions.none;
  }

  void sortByWins(SortingOptions sortingOption) {
    if(isLowToHighOrNone(sortingOption)) {
      players.sort((a, b) => b.wins.compareTo(a.wins));
      winsSorted = SortingOptions.highToLow;
    } else {
      players.sort((a, b) => a.wins.compareTo(b.wins));
      winsSorted = SortingOptions.lowToHigh;
    }
    lossesSorted = SortingOptions.none;
    playedSorted = SortingOptions.none;
    namesSorted = SortingOptions.none;
  }

  void sortByLosses(SortingOptions sortingOption) {
    if(isLowToHighOrNone(sortingOption)) {
      players.sort((a, b) => b.losses.compareTo(a.losses));
      lossesSorted = SortingOptions.highToLow;
    } else {
      players.sort((a, b) => a.losses.compareTo(b.losses));
      lossesSorted = SortingOptions.lowToHigh;
    }
    winsSorted = SortingOptions.none;
    playedSorted = SortingOptions.none;
    namesSorted = SortingOptions.none;
  }

  void sortByNames(SortingOptions sortingOption) {
    if(isLowToHighOrNone(sortingOption)) {
      players.sort((a, b) => a.name.compareTo(b.name));
      namesSorted = SortingOptions.highToLow;
    } else {
      players.sort((a, b) => b.name.compareTo(a.name));
      namesSorted = SortingOptions.lowToHigh;
    }
    winsSorted = SortingOptions.none;
    playedSorted = SortingOptions.none;
    lossesSorted = SortingOptions.none;
  }

  bool isLowToHighOrNone(SortingOptions sortingOptions) => sortingOptions == SortingOptions.lowToHigh || sortingOptions == SortingOptions.none;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            sortByNames(namesSorted);
                          });
                        },
                        child: Text(
                            'Player',
                            style: GoogleFonts.goldman(
                                fontSize: 20, color: const Color.fromARGB(255, 248, 114, 39)),
                        ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                sortByPlayedGames(playedSorted);
                              });
                            },
                            child: Text(
                              'P',
                              style: GoogleFonts.goldman(
                                  fontSize: 20, color: const Color.fromARGB(255, 248, 114, 39)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                sortByWins(winsSorted);
                              });
                            },
                            child: Text(
                              'W',
                              style: GoogleFonts.goldman(
                                  fontSize: 20, color: const Color.fromARGB(255, 248, 114, 39)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                sortByLosses(lossesSorted);
                              });
                            },
                            child: Text(
                              'L',
                              style: GoogleFonts.goldman(
                                  fontSize: 20, color: const Color.fromARGB(255, 248, 114, 39)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 3,
                color: Colors.white,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                          width: 195,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Row(
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    players[index].name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${players[index].wins + players[index].losses}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              players[index].wins.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              players[index].losses.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
    );
  }
}
