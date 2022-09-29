import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../core/common/day.dart';
import '../../../core/models/player_stat.dart';
import '../../controllers/result_stats_controller.dart';
import '../widgets.dart';
import 'charts/days_played_chart.dart';
import 'charts/my_bar_chart.dart';
import 'recent_stats_player.dart';

class RecentStatsOverall extends StatelessWidget {
  final ResultStatsController statsController;
  const RecentStatsOverall({Key? key, required this.statsController})
      : super(key: key);

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
                StatsHeader(
                  title: 'Last 30 days',
                  width: width,
                ),
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
                            StatsRow(
                              title: 'Total games played: ',
                              data:
                                  statsController.getAmountOfGames().toString(),
                            ),
                            StatsRow(
                              title: 'Singles ',
                              data: statsController.getSingles().toString(),
                            ),
                            StatsRow(
                              title: 'Doubles ',
                              data: statsController.getDoubles().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            StatsRow(
                              title: 'Number of players: ',
                              data: statsController.getPlayerCount().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            StatsRow(
                              title: 'Total sets played: ',
                              data:
                                  statsController.getAmountOfSets().toString(),
                            ),
                            StatsRow(
                              title: 'Average sets per game: ',
                              data: statsController.getAverageSets().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            StatsRow(
                              title: 'Total points played: ',
                              data: statsController
                                  .getAmountOfPoints()
                                  .toString(),
                            ),
                            StatsRow(
                              title: 'Average points per game: ',
                              data:
                                  statsController.getAveragePoints().toString(),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            BarChartColumn(
                              title: 'Most score gained:',
                              players:
                                  statsController.playersWithMostEloGained(),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            BarChartColumn(
                              title: 'Most games played:',
                              players: statsController.playersWithMostGames(),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            BarChartColumn(
                              title: 'Most wins:',
                              players: statsController.playersWithMostWins(),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Divider(),
                            ),
                            DaysChartColumn(
                                title: 'Games played per weekday:',
                                days: statsController.getAmountOfGamesPerDay()),
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
}

class BarChartColumn extends StatelessWidget {
  final String title;
  final List<PlayerStat> players;
  const BarChartColumn({Key? key, required this.title, required this.players})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorConstants.textColor,
            fontSize: 14,
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

class DaysChartColumn extends StatelessWidget {
  final String title;
  final List<Day> days;
  const DaysChartColumn({Key? key, required this.title, required this.days})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorConstants.textColor,
            fontSize: 14,
          ),
        ),
        DaysPlayedChart(
          days: days,
        ),
      ],
    );
  }
}
