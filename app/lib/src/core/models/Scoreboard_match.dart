import 'package:get_pong/protos/protos.dart';

class ScoreBoardMatch {
  final PlayerModel homeTeamOne;
  final PlayerModel homeTeamTwo;
  final PlayerModel awayTeamOne;
  final PlayerModel awayTeamTwo;
  final List<SetModel> sets;
  final bool isDouble;
  ScoreBoardMatch({
    required this.homeTeamOne,
    required this.homeTeamTwo,
    required this.awayTeamOne,
    required this.awayTeamTwo,
    required this.sets,
    required this.isDouble,
  });
}
