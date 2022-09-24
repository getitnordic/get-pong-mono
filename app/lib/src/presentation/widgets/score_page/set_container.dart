import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_pong/enums/score_type.dart';

import '../../../../constants/color_constants.dart';
import '../../../../enums/match_type.dart';
import '../../../../enums/team.dart';
import '../widgets.dart';
import 'score_counter_add.dart';
import 'score_counter_remove.dart';

class SetContainer extends StatelessWidget {
  final Animation<double> animation;
  final int setId;
  final double homeScore;
  final double awayScore;
  final MatchType matchType;
  final String playerOneName;
  final String playerTwoName;
  final String playerThreeName;
  final String playerFourName;
  final Function(int, Team, ScoreType) setScore;

  const SetContainer({
    Key? key,
    required this.animation,
    required this.setId,
    required this.homeScore,
    required this.awayScore,
    required this.matchType,
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerThreeName,
    required this.playerFourName,
    required this.setScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final horizontalHeight = MediaQuery.of(context).size.height * 0.38;
    final verticalHeight = MediaQuery.of(context).size.height * 0.16;

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      ),
      child: Column(
        children: [
          if (isPhoneOrVertical)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ResultCardContainer(
            height: isPhoneOrVertical ? verticalHeight : horizontalHeight,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCounterRemove(
                  setId: setId,
                  setScore: setScore,
                  score: homeScore,
                  team: Team.homeTeam,
                ),
                if (matchType == MatchType.single)
                  SizedBox(
                    width: isPhoneOrVertical ? 150 : 500,
                    child: ResultCardSingle(
                        name: playerOneName,
                        child: _scoreCounter(
                            homeScore.floor().toString(), isPhoneOrVertical)),
                  ),
                if (matchType == MatchType.double)
                  SizedBox(
                    width: isPhoneOrVertical ? 150 : 500,
                    child: ResultCardDouble(
                      playerOne: playerOneName,
                      playerTwo: playerTwoName,
                      child: _scoreCounter(
                          homeScore.floor().toString(), isPhoneOrVertical),
                    ),
                  ),
                ScoreCounterAdd(
                  setId: setId,
                  setScore: setScore,
                  score: homeScore,
                  team: Team.homeTeam,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ResultCardContainer(
            height: isPhoneOrVertical ? verticalHeight : horizontalHeight,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCounterRemove(
                  setId: setId,
                  setScore: setScore,
                  score: awayScore,
                  team: Team.awayTeam,
                ),
                if (matchType == MatchType.single)
                  SizedBox(
                    width: isPhoneOrVertical ? 150 : 500,
                    child: ResultCardSingle(
                        name: playerTwoName,
                        child: _scoreCounter(
                            awayScore.floor().toString(), isPhoneOrVertical)),
                  ),
                if (matchType == MatchType.double)
                  SizedBox(
                    width: isPhoneOrVertical ? 150 : 500,
                    child: ResultCardDouble(
                        playerOne: playerThreeName,
                        playerTwo: playerFourName,
                        child: _scoreCounter(
                            awayScore.floor().toString(), isPhoneOrVertical)),
                  ),
                ScoreCounterAdd(
                  setId: setId,
                  setScore: setScore,
                  score: awayScore,
                  team: Team.awayTeam,
                ),
              ],
            ),
          ),
          if (isPhoneOrVertical)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
            ),
        ],
      ),
    );
  }

  SizedBox _scoreCounter(String score, bool isPhoneOrVertical) {
    return SizedBox(
      height: isPhoneOrVertical ? 60 : 100,
      child: AutoSizeText(
        score,
        minFontSize: 11,
        maxFontSize: 168,
        maxLines: 1,
        style: const TextStyle(
          color: ColorConstants.textColor,
          fontSize: 168,
        ),
      ),
    );
  }
}
