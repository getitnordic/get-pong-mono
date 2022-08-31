import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/my_profile_image.dart';

import '../../../../protos/protos.dart';

class MatchDetailsSingle extends StatelessWidget {
  final List<ResultModel> results;
  final PlayerModel homeTeam;
  final PlayerModel awayTeam;
  const MatchDetailsSingle(
      {Key? key,
      required this.results,
      required this.homeTeam,
      required this.awayTeam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                MyProfileImage(playerId: homeTeam.id, size: 50),
                Text(homeTeam.fullName),
              ],
            ),
            const Text(' - '),
            Column(
              children: [
                MyProfileImage(playerId: awayTeam.id, size: 50),
                Text(awayTeam.fullName),
              ],
            ),
          ],
        )
      ],
    );
  }
}
