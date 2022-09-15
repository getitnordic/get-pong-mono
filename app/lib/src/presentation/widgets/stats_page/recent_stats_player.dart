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
                _header(width),
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
                            _buildStatsRow(
                              title: 'Total games played: ',
                              data:
                                  statsController.getAmountOfGames().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildStatsRow(
                              title: 'Wins: ',
                              data:
                                  statsController.getAmountOfWins().toString(),
                            ),
                            _buildStatsRow(
                              title: 'Losses: ',
                              data: statsController
                                  .getAmountOfLosses()
                                  .toString(),
                            ),
                            _buildStatsRow(
                              title: 'Win rate: ',
                              data: statsController.getWinRate(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildStatsRow(
                              title: 'Singles: ',
                              data: statsController.getSingles().toString(),
                            ),
                            _buildStatsRow(
                              title: 'Doubles: ',
                              data: statsController.getDoubles().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildStatsRow(
                              title: 'Total sets played: ',
                              data:
                                  statsController.getAmountOfSets().toString(),
                            ),
                            _buildStatsRow(
                              title: 'Average sets per game: ',
                              data: statsController.getAverageSets().toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildStatsRow(
                              title: 'Total points played: ',
                              data: statsController
                                  .getAmountOfPoints()
                                  .toString(),
                            ),
                            _buildStatsRow(
                              title: 'Average points per game: ',
                              data:
                                  statsController.getAveragePoints().toString(),
                            ),
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

  Row _buildStatsRow({required String title, required String data}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorConstants.textColor,
            fontSize: fontSize,
          ),
        ),
        Text(
          data,
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
