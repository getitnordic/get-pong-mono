import '../../../protos/game.pbgrpc.dart';
import '../common/score_checker.dart';

class MatchDetailsArguments {
  final GameModel game;
  final ScoreChecker scoreChecker;

  MatchDetailsArguments({
    required this.game,
    required this.scoreChecker,
  });
}
