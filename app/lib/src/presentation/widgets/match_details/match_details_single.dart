import 'package:flutter/material.dart';
import 'package:get_pong/protos/protos.dart';

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
            Text(homeTeam.fullName),
            const Text(' - '),
            Text(awayTeam.fullName)
          ],
        )
      ],
    );
  }
}
