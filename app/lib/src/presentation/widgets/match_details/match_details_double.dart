import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../protos/protos.dart';
import '../../../../utils/mixins/format_date_mixin.dart';
import '../my_profile_image.dart';

class MatchDetailsDouble extends StatelessWidget with FormatDateMixin {
  final List<ResultModel> results;
  final PlayerModel homeTeamOne;
  final PlayerModel awayTeamOne;
  final PlayerModel homeTeamTwo;
  final PlayerModel awayTeamTwo;
  const MatchDetailsDouble({
    Key? key,
    required this.results,
    required this.homeTeamOne,
    required this.awayTeamOne,
    required this.homeTeamTwo,
    required this.awayTeamTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          formatDateWithTime(
            results[0].timeStamp.toDateTime(),
          ),
          style: const TextStyle(
            color: ColorConstants.textColor,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                results[0].gameWon
                    ? const Text('Winners')
                    : const Text('Losers'),
                const SizedBox(
                  height: 20,
                ),
                _statsColumn(
                  result: results[0],
                  player: homeTeamOne,
                ),
                const SizedBox(
                  height: 50,
                ),
                _statsColumn(
                  result: results[2],
                  player: homeTeamTwo,
                ),
              ],
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              children: [
                results[1].gameWon
                    ? const Text('Winners')
                    : const Text('Losers'),
                const SizedBox(
                  height: 20,
                ),
                _statsColumn(
                  result: results[1],
                  player: awayTeamOne,
                ),
                const SizedBox(
                  height: 50,
                ),
                _statsColumn(
                  result: results[3],
                  player: awayTeamTwo,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _statsColumn({
    required ResultModel result,
    required PlayerModel player,
  }) =>
      Column(
        children: [
          MyProfileImage(playerId: player.id, size: 80),
          const SizedBox(
            height: 30,
          ),
          Text(
            player.fullName,
            style: const TextStyle(
              color: ColorConstants.textColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Score change: ',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 14,
                ),
              ),
              Text(
                result.eloDiff.toString(),
                style: TextStyle(
                  color: _isPositive(result) ? Colors.green : Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            'New score: ${result.newElo}',
            style: const TextStyle(
              color: ColorConstants.textColor,
              fontSize: 14,
            ),
          ),
          Text(
            'Old score: ${_getOldElo(result)}',
            style: const TextStyle(
              color: ColorConstants.textColor,
              fontSize: 14,
            ),
          ),
        ],
      );

  int _getOldElo(ResultModel result) => result.newElo - result.eloDiff;
  bool _isPositive(ResultModel result) => result.eloDiff > 0;
}
