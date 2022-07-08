// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Presentation/providers/matches_notifier.dart';
import '../../Presentation/widgets/widgets.dart';
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
    bool set1Complete = false;
    bool set2Complete = false;
    bool set3Complete = false;
    bool set4Complete = false;
    bool set5Complete = false;

    if (set1HomeScore == 11 || set1AwayScore == 11) {
      if (set1HomeScore != set1AwayScore) {
        set1Complete = true;
      }
    }
    if (set2HomeScore == 11 || set2AwayScore == 11) {
      if (set2HomeScore != set2AwayScore) {
        set2Complete = true;
      }
    }
    if (set3HomeScore == 11 || set3AwayScore == 11) {
      if (set3HomeScore != set3AwayScore) {
        set3Complete = true;
      }
    }
    if (set4HomeScore == 11 || set4AwayScore == 11) {
      if (set4HomeScore != set4AwayScore) {
        set4Complete = true;
      }
    }
    if (set5HomeScore == 11 || set5AwayScore == 11) {
      if (set5HomeScore != set5AwayScore) {
        set5Complete = true;
      }
    }

    if (setOption == 0) {
      return set1Complete;
    }
    if (setOption == 1) {
      if (set3HomeScore == 11 && set3AwayScore == 11) {
        return false;
      }
      if (threeSetWinnerExists()) {
        return set1Complete && set2Complete;
      }
      return set1Complete && set2Complete && set3Complete;
    }
    if (setOption == 2) {
      if (set5Complete) {
        if (fiveSetWinnerExists()) {
          return set1Complete &&
              set2Complete &&
              set3Complete &&
              set4Complete &&
              set5Complete;
        }
      }

      if (set4Complete) {
        if (set5HomeScore == 11 && set5AwayScore == 11) {
          return false;
        }
        if (fiveSetWinnerExists()) {
          return set1Complete && set2Complete && set3Complete && set4Complete;
        }
      }

      if (set3Complete) {
        if (set4HomeScore == 11 && set4AwayScore == 11) {
          return false;
        }
        if (fiveSetWinnerExists()) {
          return set1Complete && set2Complete && set3Complete;
        }
      }

      return set1Complete &&
          set2Complete &&
          set3Complete &&
          set4Complete &&
          set5Complete;
    }
    return false;
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350,
                        child: Align(
                          alignment: Alignment.center,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: ColorConstants.appBarColor,
                              border: Border.all(
                                  color: ColorConstants.secondaryTextColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: ColorConstants.appBarColor,
                                borderRadius: BorderRadius.circular(10),
                                value: setOption,
                                items: const [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Best of 1'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Best of 3'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Best of 5'),
                                    ),
                                  ),
                                ],
                                onChanged: (int? value) {
                                  setState(() {
                                    setOption = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 350,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Set 1'),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Team 1    ${set1HomeScore.round()}',
                                        style: GoogleFonts.goldman(
                                          color: ColorConstants.textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        ' - ',
                                        style: GoogleFonts.goldman(
                                          color: ColorConstants.textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${set1AwayScore.round()}    Team 2',
                                        style: GoogleFonts.goldman(
                                          color: ColorConstants.textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (matchType == MatchType.single)
                                    ResultCardContainer(
                                      width: 350,
                                      height: 80,
                                      child: ResultCardSingle(
                                        name: displayName(playerOne),
                                        child: AddResultForm(
                                          callback: setScore1,
                                        ),
                                      ),
                                    ),
                                  if (matchType == MatchType.double)
                                    ResultCardContainer(
                                      width: 350,
                                      height: 200,
                                      child: ResultCardDouble(
                                        title: 'Team 1',
                                        playerOne: displayName(playerOne),
                                        playerTwo: displayName(playerTwo),
                                        child: AddResultForm(
                                          callback: setScore1,
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (matchType == MatchType.single)
                                    ResultCardContainer(
                                      width: 350,
                                      height: 80,
                                      child: ResultCardSingle(
                                        name: displayName(playerTwo),
                                        child: AddResultForm(
                                          callback: setScore2,
                                        ),
                                      ),
                                    ),
                                  if (matchType == MatchType.double)
                                    ResultCardContainer(
                                      width: 350,
                                      height: 200,
                                      child: ResultCardDouble(
                                        title: 'Team 2',
                                        playerOne: displayName(playerThree),
                                        playerTwo: displayName(playerFour),
                                        child: AddResultForm(
                                          callback: setScore2,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (setOption == 1 || setOption == 2) ...[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('Set 2'),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team 1    ${set2HomeScore.round()}',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${set2AwayScore.round()}    Team 2',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerOne),
                                          child: AddResultForm(
                                            callback: setScore3,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 1',
                                          playerOne: displayName(playerOne),
                                          playerTwo: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore3,
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore4,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 2',
                                          playerOne: displayName(playerThree),
                                          playerTwo: displayName(playerFour),
                                          child: AddResultForm(
                                            callback: setScore4,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('Set 3'),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team 1    ${set3HomeScore.round()}',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${set3AwayScore.round()}    Team 2',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerOne),
                                          child: AddResultForm(
                                            callback: setScore5,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 1',
                                          playerOne: displayName(playerOne),
                                          playerTwo: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore5,
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore6,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 2',
                                          playerOne: displayName(playerThree),
                                          playerTwo: displayName(playerFour),
                                          child: AddResultForm(
                                            callback: setScore6,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                            if (setOption == 2) ...[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('Set 4'),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team 1    ${set4HomeScore.round()}',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${set4AwayScore.round()}    Team 2',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerOne),
                                          child: AddResultForm(
                                            callback: setScore7,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 1',
                                          playerOne: displayName(playerOne),
                                          playerTwo: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore7,
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore8,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 2',
                                          playerOne: displayName(playerThree),
                                          playerTwo: displayName(playerFour),
                                          child: AddResultForm(
                                            callback: setScore8,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('Set 5'),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team 1    ${set5HomeScore.round()}',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${set5AwayScore.round()}    Team 2',
                                          style: GoogleFonts.goldman(
                                            color: ColorConstants.textColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerOne),
                                          child: AddResultForm(
                                            callback: setScore9,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 1',
                                          playerOne: displayName(playerOne),
                                          playerTwo: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore9,
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (matchType == MatchType.single)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 80,
                                        child: ResultCardSingle(
                                          name: displayName(playerTwo),
                                          child: AddResultForm(
                                            callback: setScore10,
                                          ),
                                        ),
                                      ),
                                    if (matchType == MatchType.double)
                                      ResultCardContainer(
                                        width: 350,
                                        height: 200,
                                        child: ResultCardDouble(
                                          title: 'Team 2',
                                          playerOne: displayName(playerThree),
                                          playerTwo: displayName(playerFour),
                                          child: AddResultForm(
                                            callback: setScore10,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ],
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
                      children: [
                        SizedBox(height: 35),
                        SizedBox(
                          width: 350,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: ColorConstants.appBarColor,
                                border: Border.all(
                                    color: ColorConstants.secondaryTextColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorConstants.appBarColor,
                                  borderRadius: BorderRadius.circular(10),
                                  value: setOption,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 0,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Best of 1'),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Best of 3'),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Best of 5'),
                                      ),
                                    ),
                                  ],
                                  onChanged: (int? value) {
                                    setState(() {
                                      setOption = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Set 1'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Team 1    ${set1HomeScore.round()}',
                              style: GoogleFonts.goldman(
                                color: ColorConstants.textColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ' - ',
                              style: GoogleFonts.goldman(
                                color: ColorConstants.textColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${set1AwayScore.round()}    Team 2',
                              style: GoogleFonts.goldman(
                                color: ColorConstants.textColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if (matchType == MatchType.single)
                          ResultCardContainer(
                            width: 350,
                            height: 80,
                            child: ResultCardSingle(
                              name: displayName(playerOne),
                              child: AddResultForm(
                                callback: setScore1,
                              ),
                            ),
                          ),
                        if (matchType == MatchType.double)
                          ResultCardContainer(
                            width: 350,
                            height: 200,
                            child: ResultCardDouble(
                              title: 'Team 1',
                              playerOne: displayName(playerOne),
                              playerTwo: displayName(playerTwo),
                              child: AddResultForm(
                                callback: setScore1,
                              ),
                            ),
                          ),
                        SizedBox(height: 10),
                        if (matchType == MatchType.single)
                          ResultCardContainer(
                            width: 350,
                            height: 80,
                            child: ResultCardSingle(
                              name: displayName(playerTwo),
                              child: AddResultForm(
                                callback: setScore2,
                              ),
                            ),
                          ),
                        if (matchType == MatchType.double)
                          ResultCardContainer(
                            width: 350,
                            height: 200,
                            child: ResultCardDouble(
                              title: 'Team 2',
                              playerOne: displayName(playerThree),
                              playerTwo: displayName(playerFour),
                              child: AddResultForm(
                                callback: setScore2,
                              ),
                            ),
                          ),
                        if (setOption == 1 || setOption == 2) ...[
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 350,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Set 2'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Team 1    ${set2HomeScore.round()}',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' - ',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${set2AwayScore.round()}    Team 2',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerOne),
                                child: AddResultForm(
                                  callback: setScore3,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 1',
                                playerOne: displayName(playerOne),
                                playerTwo: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore3,
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore4,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 2',
                                playerOne: displayName(playerThree),
                                playerTwo: displayName(playerFour),
                                child: AddResultForm(
                                  callback: setScore4,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 350,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Set 3'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Team 1    ${set3HomeScore.round()}',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' - ',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${set3AwayScore.round()}    Team 2',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerOne),
                                child: AddResultForm(
                                  callback: setScore5,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 1',
                                playerOne: displayName(playerOne),
                                playerTwo: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore5,
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore6,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 2',
                                playerOne: displayName(playerThree),
                                playerTwo: displayName(playerFour),
                                child: AddResultForm(
                                  callback: setScore6,
                                ),
                              ),
                            ),
                        ],
                        if (setOption == 2) ...[
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 350,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Set 4'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Team 1    ${set4HomeScore.round()}',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' - ',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${set4AwayScore.round()}    Team 2',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerOne),
                                child: AddResultForm(
                                  callback: setScore7,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 1',
                                playerOne: displayName(playerOne),
                                playerTwo: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore7,
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore8,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 2',
                                playerOne: displayName(playerThree),
                                playerTwo: displayName(playerFour),
                                child: AddResultForm(
                                  callback: setScore8,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 350,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Set 5'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Team 1    ${set5HomeScore.round()}',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' - ',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${set5AwayScore.round()}    Team 2',
                                style: GoogleFonts.goldman(
                                  color: ColorConstants.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerOne),
                                child: AddResultForm(
                                  callback: setScore9,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 1',
                                playerOne: displayName(playerOne),
                                playerTwo: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore9,
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                          if (matchType == MatchType.single)
                            ResultCardContainer(
                              width: 350,
                              height: 80,
                              child: ResultCardSingle(
                                name: displayName(playerTwo),
                                child: AddResultForm(
                                  callback: setScore10,
                                ),
                              ),
                            ),
                          if (matchType == MatchType.double)
                            ResultCardContainer(
                              width: 350,
                              height: 200,
                              child: ResultCardDouble(
                                title: 'Team 2',
                                playerOne: displayName(playerThree),
                                playerTwo: displayName(playerFour),
                                child: AddResultForm(
                                  callback: setScore10,
                                ),
                              ),
                            ),
                        ],
                        SizedBox(height: 15),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 300,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                              const Size(300, 50)),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return ColorConstants.primaryColor;
                                          } else if (states.contains(
                                              MaterialState.disabled)) {
                                            return ColorConstants
                                                .disabledButtonColor;
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
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorConstants.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
