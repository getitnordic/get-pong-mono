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

import '../providers/matches_notifier.dart';
import '../widgets/score_page/scorepage.dart';

class ScorePage extends ConsumerStatefulWidget {
  final List<PlayerModel> selectedPlayers;
  const ScorePage({
    Key? key,
    required this.selectedPlayers,
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
  int? selectedValue = 0;

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
    return playerHasNickname(player) ? player.nickname : player.firstName;
  }

  @override
  Widget build(BuildContext context) {
    final matchesNotifier = ref.watch(matchesProvider.notifier);
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selectedPlayersNotifier = ref.watch(selectedProvider.notifier);
    final matchType = ref.watch(matchTypeProvider);
    final playerOne = widget.selectedPlayers[0];
    final playerTwo = widget.selectedPlayers[1];
    final playerThree = widget.selectedPlayers[2];
    final playerFour = widget.selectedPlayers[3];

    void saveNewMatch() {
      if (selectedValue == 1) {
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
      } else if (selectedValue == 2) {
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 20, maxHeight: 1500),
            child: Column(
              children: [
                SizedBox(height: 35),
                SizedBox(
                  width: 350,
                  child: Align(
                    alignment: Alignment.centerRight,
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
                          value: selectedValue,
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
                              selectedValue = value;
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
                    alignment: Alignment.centerLeft,
                    child: Text('Set 1: '),
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
                if (selectedValue == 1 || selectedValue == 2) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Set 2: '),
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
                        alignment: Alignment.centerLeft,
                        child: Text('Set 3: '),
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
                if (selectedValue == 2) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Set 4: '),
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
                        alignment: Alignment.centerLeft,
                        child: Text('Set 5: '),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 40,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              saveNewMatch();

                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorConstants.primaryColor,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Save Result',
                              style: GoogleFonts.goldman(
                                color: ColorConstants.textColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 40,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              saveNewMatch();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: SizedBox(
                                    width: 400,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Add new result',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: ColorConstants.appBarColor,
                                  elevation: 1000,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              set1HomeScore = 5;
                              set1AwayScore = 5;
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorConstants.primaryColor,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Rematch',
                              style: GoogleFonts.goldman(
                                color: ColorConstants.textColor,
                                fontSize: 20,
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
        ),
      ),
    );
  }
}
