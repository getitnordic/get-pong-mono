// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Presentation/providers/matches_notifier.dart';
import '../../core/models/score_page_set.dart';

class ScorePage extends ConsumerStatefulWidget {
  final List<PlayerModel> selectedPlayers;
  final MatchType matchType;
  const ScorePage({
    Key? key,
    required this.selectedPlayers,
    required this.matchType,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScorePageState();
}

class _ScorePageState extends ConsumerState<ScorePage> {
  int setCounter = 1;
  int currentSetId = 0;
  List<ScorePageSet> sets = [
    ScorePageSet(
      homeScore: 5,
      awayScore: 5,
      setId: 1,
    )
  ];

  double set1HomeScore = 5;
  double set1AwayScore = 5;
  double set2HomeScore = 5;
  double set2AwayScore = 5;
  double set3HomeScore = 5;
  double set3AwayScore = 5;
  double set4HomeScore = 5;
  double set4AwayScore = 5;
  double set5HomeScore = 5;
  double set5AwayScore = 5;
  int? setOption = 0;

  void addSet(ScorePageSet set) {
    setState(() {
      sets.add(set);
    });
  }

  void removeSet() {
    setState(
      () {
        sets.removeLast();
      },
    );
  }

  void setHomeScore(double score) {
    setState(() {
      sets[currentSetId].homeScore = score;
    });
  }

  void setAwayScore(double score) {
    setState(() {
      sets[currentSetId].awayScore = score;
    });
  }

  void setCurrentSetId(int setId) {
    currentSetId = setId;
  }

  void setScore1(double score) {
    setState(() {
      set1HomeScore = score;
    });
  }

  void setScore2(double score) {
    setState(() {
      set1AwayScore = score;
    });
  }

  void setScore3(double score) {
    setState(() {
      set2HomeScore = score;
    });
  }

  void setScore4(double score) {
    setState(() {
      set2AwayScore = score;
    });
  }

  void setScore5(double score) {
    setState(() {
      set3HomeScore = score;
    });
  }

  void setScore6(double score) {
    setState(() {
      set3AwayScore = score;
    });
  }

  void setScore7(double score) {
    setState(() {
      set4HomeScore = score;
    });
  }

  void setScore8(double score) {
    setState(() {
      set4AwayScore = score;
    });
  }

  void setScore9(double score) {
    setState(() {
      set5HomeScore = score;
    });
  }

  void setScore10(double score) {
    setState(() {
      set5AwayScore = score;
    });
  }

  bool playerHasNickname(PlayerModel player) {
    return player.nickname != 'nickname' && player.nickname != '';
  }

  String displayName(PlayerModel player) {
    return playerHasNickname(player) ? player.nickname : player.fullName;
  }

  int checkHomeTeamScore() {
    int setPoints = 0;
    if (set1HomeScore == 11) {
      setPoints++;
    }
    if (set2HomeScore == 11) {
      setPoints++;
    }
    if (setOption == 1) {
      if (setPoints > 1) {
        return setPoints;
      }
    }
    if (set3HomeScore == 11) {
      setPoints++;
    }
    if (setPoints > 2) {
      return setPoints;
    }
    if (set4HomeScore == 11) {
      setPoints++;
    }
    if (setPoints > 2) {
      return setPoints;
    }
    if (set5HomeScore == 11) {
      setPoints++;
    }
    return setPoints;
  }

  int checkAwayTeamScore() {
    int setPoints = 0;
    if (set1AwayScore == 11) {
      setPoints++;
    }
    if (set2AwayScore == 11) {
      setPoints++;
    }
    if (setOption == 1) {
      if (setPoints > 1) {
        return setPoints;
      }
    }
    if (set3AwayScore == 11) {
      setPoints++;
    }
    if (setPoints > 2) {
      return setPoints;
    }
    if (set4AwayScore == 11) {
      setPoints++;
    }
    if (setPoints > 2) {
      return setPoints;
    }
    if (set5AwayScore == 11) {
      setPoints++;
    }
    return setPoints;
  }

  bool checkIfScoresAreSet() {
    for (final ScorePageSet set in sets) {
      if (!set.isScoreSet()) {
        return false;
      }
    }
    return true;
  }

  bool fiveSetWinnerExists() =>
      checkHomeTeamScore() == 3 || checkAwayTeamScore() == 3;
  bool threeSetWinnerExists() =>
      checkHomeTeamScore() == 2 || checkAwayTeamScore() == 2;

  @override
  Widget build(BuildContext context) {
    final matchesNotifier = ref.watch(matchesProvider.notifier);
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selectedPlayersNotifier = ref.watch(selectedProvider.notifier);
    final matchType = widget.matchType;
    final playerOne = widget.selectedPlayers[0];
    final playerTwo = widget.selectedPlayers[1];
    final playerThree = widget.selectedPlayers[2];
    final playerFour = widget.selectedPlayers[3];

    void saveNewMatch() {
      if (setOption == 1) {
        if (widget.selectedPlayers[2].nickname.isNotEmpty) {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id, playerTwo.id],
            awayTeamIds: [playerThree.id, playerFour.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
              SetModel(
                setNo: 2,
                homeTeam: set2HomeScore.toInt(),
                awayTeam: set2AwayScore.toInt(),
              ),
              SetModel(
                setNo: 3,
                homeTeam: set3HomeScore.toInt(),
                awayTeam: set3AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        } else {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id],
            awayTeamIds: [playerTwo.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
              SetModel(
                setNo: 2,
                homeTeam: set2HomeScore.toInt(),
                awayTeam: set2AwayScore.toInt(),
              ),
              SetModel(
                setNo: 3,
                homeTeam: set3HomeScore.toInt(),
                awayTeam: set3AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        }
      } else if (setOption == 2) {
        if (widget.selectedPlayers[2].nickname.isNotEmpty) {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id, playerTwo.id],
            awayTeamIds: [playerThree.id, playerFour.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
              SetModel(
                setNo: 2,
                homeTeam: set2HomeScore.toInt(),
                awayTeam: set2AwayScore.toInt(),
              ),
              SetModel(
                setNo: 3,
                homeTeam: set3HomeScore.toInt(),
                awayTeam: set3AwayScore.toInt(),
              ),
              SetModel(
                setNo: 4,
                homeTeam: set4HomeScore.toInt(),
                awayTeam: set4AwayScore.toInt(),
              ),
              SetModel(
                setNo: 5,
                homeTeam: set5HomeScore.toInt(),
                awayTeam: set5AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        } else {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id],
            awayTeamIds: [playerTwo.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
              SetModel(
                setNo: 2,
                homeTeam: set2HomeScore.toInt(),
                awayTeam: set2AwayScore.toInt(),
              ),
              SetModel(
                setNo: 3,
                homeTeam: set3HomeScore.toInt(),
                awayTeam: set3AwayScore.toInt(),
              ),
              SetModel(
                setNo: 4,
                homeTeam: set4HomeScore.toInt(),
                awayTeam: set4AwayScore.toInt(),
              ),
              SetModel(
                setNo: 5,
                homeTeam: set5HomeScore.toInt(),
                awayTeam: set5AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        }
      } else {
        if (widget.selectedPlayers[2].nickname.isNotEmpty) {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id, playerTwo.id],
            awayTeamIds: [playerThree.id, playerFour.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        } else {
          GameModel match = GameModel(
            homeTeamIds: [playerOne.id],
            awayTeamIds: [playerTwo.id],
            sets: [
              SetModel(
                setNo: 1,
                homeTeam: set1HomeScore.toInt(),
                awayTeam: set1AwayScore.toInt(),
              ),
            ],
          );
          matchesNotifier.createGame(match);
          selectedPlayersNotifier.resetState();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Score'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape &&
                  MediaQuery.of(context).size.height > 500
              ? Column(
                  children: [
                    Center(
                      child: Container(
                        height: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: sets.length,
                          itemBuilder: (context, index) {
                            return SetContainer(
                              setId: index,
                              homeScore: sets[index].homeScore,
                              awayScore: sets[index].awayScore,
                              matchType: matchType,
                              playerOneName: displayName(playerOne),
                              playerTwoName: displayName(playerTwo),
                              playerThreeName: displayName(playerThree),
                              playerFourName: displayName(playerFour),
                              setHomeScore: setHomeScore,
                              setAwayScore: setAwayScore,
                              getSetId: setCurrentSetId,
                              removeSet: removeSet,
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(300, 50)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return ColorConstants.primaryColor;
                                    } else if (states
                                        .contains(MaterialState.disabled)) {
                                      return ColorConstants.disabledButtonColor;
                                    }
                                    return ColorConstants.primaryColor;
                                  },
                                ),
                              ),
                              onPressed: checkIfScoresAreSet()
                                  ? () {
                                      saveNewMatch();
                                      Navigator.pop(context);
                                    }
                                  : null,
                              child: Text(
                                'Save Result',
                                style: GoogleFonts.goldman(
                                  fontSize: 20,
                                  color: ColorConstants.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            setCounter++;
            sets.add(
              ScorePageSet(
                homeScore: 5,
                awayScore: 5,
                setId: setCounter,
              ),
            );
          });
        },
        backgroundColor: ColorConstants.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
