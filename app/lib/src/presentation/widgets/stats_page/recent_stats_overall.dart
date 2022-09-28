import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../widgets.dart';
import 'charts/days_played_chart.dart';
import 'charts/my_bar_chart.dart';
import '../../controllers/result_stats_controller.dart';

class RecentStatsOverall extends StatelessWidget {
  final ResultStatsController statsController;
  const RecentStatsOverall({Key? key, required this.statsController})
      : super(key: key);

  final fontSize = 14.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var notEnoughData = statsController.getPlayerCount() < 5;
    return notEnoughData
        ? const Center(child: Text('No data'))
        : SingleChildScrollView(
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
                      height: 1420,
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
                            _playersParticipating(),
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
                            _playersWithMostEloGained(),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            _playersWithMostGames(),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            _playersWithMostWins(),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            _gamesPlayedByDay(),
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
          width: width < 500 ? 50 : 100,
          child: const Divider(
            indent: 15,
            endIndent: 15,
          ),
        ),
        const CustomSmallContainer(
          height: 40,
          width: 200,
          child: Center(
            child: Text(
              'Last 30 days',
              style: TextStyle(
                color: ColorConstants.textColor,
                fontSize: 24,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width < 500 ? 50 : 100,
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

  Row _playersParticipating() {
    return Row(
      children: [
        Text(
          'Number of players: ',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          statsController.getPlayerCount().toString(),
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

  Column _gamesPlayedByDay() {
    final days = statsController.getAmountOfGamesPerDay();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Games played per weekday:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        DaysPlayedChart(
          days: days,
        ),
      ],
    );
  }

  Column _playersWithMostGames() {
    final players = statsController.playersWithMostGames();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most games played:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        MyBarChart(players: players),
      ],
    );
  }

  Column _playersWithMostWins() {
    final players = statsController.playersWithMostWins();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most wins:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        MyBarChart(players: players),
      ],
    );
  }

  Column _playersWithMostEloGained() {
    final players = statsController.playersWithMostEloGained();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most score gained:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        MyBarChart(players: players),
      ],
    );
  }
}
