import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/stats_page/charts/elo_change_chart.dart';
import 'package:get_pong/src/presentation/widgets/stats_page/charts/elo_chart_data.dart';

import '../../../../constants/color_constants.dart';
import '../widgets.dart';
import 'player_stats_controller.dart';

class RecentStatsPlayer extends StatelessWidget {
  final PlayerStatsController statsController;
  const RecentStatsPlayer({Key? key, required this.statsController})
      : super(key: key);

  final fontSize = 14.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          _header(width),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: CustomSmallContainer(
                height: 470,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      _gamesPlayedTotal(),
                      _singlesPlayed(),
                      _doublesPlayed(),
                      const SizedBox(
                        height: 10,
                      ),
                      _setsPlayedTotal(),
                      _averageSetsPerGame(),
                      const SizedBox(
                        height: 10,
                      ),
                      _pointsPlayedTotal(),
                      _averagePointsPerGame(),
                      const SizedBox(
                        height: 20,
                        child: Divider(),
                      ),
                      _eloGains(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _header(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width < 500 ? 25 : 50,
          child: const Divider(
            indent: 15,
            endIndent: 15,
          ),
        ),
        CustomSmallContainer(
          height: 40,
          width: 250,
          child: Center(
            child: Text(
              statsController.player.fullName,
              style: const TextStyle(
                color: ColorConstants.textColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width < 500 ? 25 : 50,
          child: const Divider(
            indent: 15,
            endIndent: 15,
          ),
        ),
      ],
    );
  }

  Row _gamesPlayedTotal() {
    return Row(
      children: [
        Text(
          'Total games played: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getAmountOfGames().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _singlesPlayed() {
    return Row(
      children: [
        Text(
          'Singles: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getSingles().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _doublesPlayed() {
    return Row(
      children: [
        Text(
          'Doubles: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getDoubles().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _setsPlayedTotal() {
    return Row(
      children: [
        Text(
          'Total sets played: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getAmountOfSets().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _pointsPlayedTotal() {
    return Row(
      children: [
        Text(
          'Total points played: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getAmountOfPoints().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _averageSetsPerGame() {
    return Row(
      children: [
        Text(
          'Average sets per game: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getAverageSets().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Row _averagePointsPerGame() {
    return Row(
      children: [
        Text(
          'Average points per game: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getAveragePoints().toString(),
          style: TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Column _eloGains() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Score change:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        EloChangeChart(data: EloChartData(statsController.getEloData())),
      ],
    );
  }
}
