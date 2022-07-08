import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants.dart';
import '../../../../enums/match_type.dart';
import '../widgets.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: 350,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Set ${setId + 1}'),
                if (setId != 0)
                  IconButton(
                    onPressed: () {
                      removeSet();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 25,
                    ),
                  )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Team 1    ${homeScore.round()}',
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
                '${awayScore.round()}    Team 2',
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
                name: playerOneName,
                child: AddResultForm(
                  callback: setHomeScore,
                  setId: setId,
                  getSetId: getSetId,
                ),
              ),
            ),
          if (matchType == MatchType.double)
            ResultCardContainer(
              width: 350,
              height: 200,
              child: ResultCardDouble(
                title: 'Team 1',
                playerOne: playerOneName,
                playerTwo: playerTwoName,
                child: AddResultForm(
                  callback: setHomeScore,
                  setId: setId,
                  getSetId: getSetId,
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          if (matchType == MatchType.single)
            ResultCardContainer(
              width: 350,
              height: 80,
              child: ResultCardSingle(
                name: playerTwoName,
                child: AddResultForm(
                  callback: setAwayScore,
                  setId: setId,
                  getSetId: getSetId,
                ),
              ),
            ),
          if (matchType == MatchType.double)
            ResultCardContainer(
              width: 350,
              height: 200,
              child: ResultCardDouble(
                title: 'Team 2',
                playerOne: playerThreeName,
                playerTwo: playerFourName,
                child: AddResultForm(
                  callback: setAwayScore,
                  setId: setId,
                  getSetId: getSetId,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
