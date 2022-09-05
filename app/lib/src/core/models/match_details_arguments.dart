import '../../../protos/game.pbgrpc.dart';
import '../../Presentation/widgets/scoreboard/updated_scorecard/scoreboard_controller.dart';


class MatchDetailsArguments {
  final GameModel game;
  final ScoreboardController controller;

  MatchDetailsArguments({
    required this.game,
    required this.controller,
  });
}
