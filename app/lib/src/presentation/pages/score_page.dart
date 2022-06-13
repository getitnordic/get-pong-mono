// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/src/Presentation/providers/match_notifier.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/score_page/my_add_result_form.dart';
import 'package:get_pong/src/Presentation/widgets/score_page/result_card_container.dart';
import 'package:get_pong/src/Presentation/widgets/score_page/result_card_double.dart';
import 'package:get_pong/src/Presentation/widgets/score_page/result_card_single.dart';
import 'package:get_pong/src/domain/models/game.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/models/player.dart';

class ScorePage extends ConsumerWidget {
  final List<Player> selectedPlayers;

  const ScorePage({
    Key? key,
    required this.selectedPlayers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesNotifier = ref.watch(singleMatchProvider.notifier);
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selectedPlayersNotifier = ref.watch(selectedProvider.notifier);
    final matchType = ref.watch(matchTypeProvider);
    final playerOne = selectedPlayers[0];
    final playerTwo = selectedPlayers[1];
    final playerThree = selectedPlayers[2];
    final playerFour = selectedPlayers[3];
    double scoreOne = 5;
    double scoreTwo = 5;

    void setScoreOne(double score) {
      scoreOne = score;
    }

    void setScoreTwo(double score) {
      scoreTwo = score;
    }

    void saveNewMatch() {
      if (selectedPlayers[2].nickname.isNotEmpty) {
        Game match = Game(
          teamOne: [playerOne, playerTwo],
          teamTwo: [playerThree, playerFour],
          teamOneScore: scoreOne.toInt(),
          teamTwoScore: scoreTwo.toInt(),
        );
        matchesNotifier.addMatch(match);
        selectedPlayersNotifier.resetState();
      } else {
        Game match = Game(
          teamOne: [playerOne],
          teamTwo: [playerTwo],
          teamOneScore: scoreOne.toInt(),
          teamTwoScore: scoreTwo.toInt(),
        );
        matchesNotifier.addMatch(match);
        selectedPlayersNotifier.resetState();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Score'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 20, maxHeight: 1000),
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 35),
            if (matchType == MatchType.single)
              ResultCardContainer(
                width: 350,
                height: 150,
                child: ResultCardSingle(
                  name: playerOne.nickname,
                  child: AddResultForm(
                    callback: setScoreOne,
                  ),
                ),
              ),
            if (matchType == MatchType.double)
              ResultCardContainer(
                width: 350,
                height: 200,
                child: ResultCardDouble(
                  title: 'Team 1',
                  playerOne: playerOne.nickname,
                  playerTwo: playerTwo.nickname,
                  child: AddResultForm(
                    callback: setScoreOne,
                  ),
                ),
              ),
            SizedBox(height: 35),
            if (matchType == MatchType.single)
              ResultCardContainer(
                width: 350,
                height: 150,
                child: ResultCardSingle(
                  name: playerTwo.nickname,
                  child: AddResultForm(
                    callback: setScoreTwo,
                  ),
                ),
              ),
            if (matchType == MatchType.double)
              ResultCardContainer(
                width: 350,
                height: 200,
                child: ResultCardDouble(
                  title: 'Team 2',
                  playerOne: playerThree.nickname,
                  playerTwo: playerFour.nickname,
                  child: AddResultForm(
                    callback: setScoreTwo,
                  ),
                ),
              ),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          scoreOne = 5;
                          scoreTwo = 5;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ColorConstants.primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
