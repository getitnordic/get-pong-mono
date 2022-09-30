import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../widgets.dart';
import 'charts/elo_change_chart.dart';
import 'charts/elo_chart_data.dart';
import '../../controllers/player_stats_controller.dart';

class RecentStatsPlayer extends StatelessWidget {
  final PlayerStatsController statsController;
  const RecentStatsPlayer({Key? key, required this.statsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notEnoughData = statsController.results.isEmpty;
    final width = MediaQuery.of(context).size.width;
    return notEnoughData
        ? const Center(child: Text('No data'))
        : SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                StatsHeader(
                  title: statsController.player.fullName,
                  width: width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: CustomSmallContainer(
                      height: 530,
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
                            const SizedBox(
                              height: 10,
                            ),
                            StatsRow(
                              title: 'Wins: ',
                              data:
                                  statsController.getAmountOfWins().toString(),
                            ),
                            StatsRow(
                              title: 'Losses: ',
                              data: statsController
                                  .getAmountOfLosses()
                                  .toString(),
                            ),
                            StatsRow(
                              title: 'Win rate: ',
                              data: statsController.getWinRate(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            StatsRow(
                              title: 'Singles: ',
                              data: statsController.getSingles().toString(),
                            ),
                            StatsRow(
                              title: 'Doubles: ',
                              data: statsController.getDoubles().toString(),
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
                            EloGains(statsController: statsController),
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

class StatsRow extends StatelessWidget {
  final String title;
  final String data;
  const StatsRow({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorConstants.textColor,
            fontSize: 14,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            color: ColorConstants.secondaryTextColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class EloGains extends StatelessWidget {
  final PlayerStatsController statsController;
  const EloGains({Key? key, required this.statsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Score change:',
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: 14,
          ),
        ),
        EloChangeChart(data: EloChartData(statsController.getEloData())),
      ],
    );
  }
}

class StatsHeader extends StatelessWidget {
  final String title;
  final double width;
  const StatsHeader({Key? key, required this.width, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              title,
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
}
