import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../enums/match_type.dart';
import '../widgets.dart';
import 'score_counter_add.dart';
import 'score_counter_remove.dart';

class SetContainer extends StatelessWidget {
  final int setId;
  final double homeScore;
  final double awayScore;
  final MatchType matchType;
  final String playerOneName;
  final String playerTwoName;
  final String playerThreeName;
  final String playerFourName;
  final Function(double) setHomeScore;
  final Function(double) setAwayScore;
  final Function(int) getSetId;
  final Function removeSet;
  final int setCount;
  const SetContainer({
    Key? key,
    required this.setId,
    required this.homeScore,
    required this.awayScore,
    required this.matchType,
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerThreeName,
    required this.playerFourName,
    required this.setHomeScore,
    required this.setAwayScore,
    required this.getSetId,
    required this.removeSet,
    required this.setCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: 550,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Set ${setId + 1}'),
                if (setId == setCount - 1 && setId != 0)
                  CustomSmallContainer(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        removeSet();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  )
              ],
            ),
          ),
          ResultCardContainer(
            height: matchType == MatchType.double ? 140 : 100,
            width: 550,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCounterRemove(
                  setId: setId,
                  setScore: setHomeScore,
                  getSetId: getSetId,
                  score: homeScore,
                ),
                if (matchType == MatchType.single)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 200,
                      child: ResultCardSingle(
                        name: playerOneName,
                        child: Text(
                          homeScore.floor().toString(),
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 38,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (matchType == MatchType.double)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 200,
                      child: ResultCardDouble(
                        playerOne: playerOneName,
                        playerTwo: playerTwoName,
                        child: Text(
                          homeScore.floor().toString(),
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ScoreCounterAdd(
                  setId: setId,
                  setScore: setHomeScore,
                  getSetId: getSetId,
                  score: homeScore,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ResultCardContainer(
            height: matchType == MatchType.double ? 140 : 100,
            width: 550,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCounterRemove(
                  setId: setId,
                  setScore: setAwayScore,
                  getSetId: getSetId,
                  score: awayScore,
                ),
                if (matchType == MatchType.single)
                  SizedBox(
                    width: 200,
                    child: ResultCardSingle(
                      name: playerTwoName,
                      child: Text(
                        awayScore.floor().toString(),
                        style: const TextStyle(
                          color: ColorConstants.textColor,
                          fontSize: 38,
                        ),
                      ),
                    ),
                  ),
                if (matchType == MatchType.double)
                  SizedBox(
                    width: 200,
                    child: ResultCardDouble(
                      playerOne: playerThreeName,
                      playerTwo: playerFourName,
                      child: Text(
                        awayScore.floor().toString(),
                        style: const TextStyle(
                          color: ColorConstants.textColor,
                          fontSize: 38,
                        ),
                      ),
                    ),
                  ),
                ScoreCounterAdd(
                  setId: setId,
                  setScore: setAwayScore,
                  getSetId: getSetId,
                  score: awayScore,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
