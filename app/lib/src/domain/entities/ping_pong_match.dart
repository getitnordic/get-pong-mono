import 'package:get_pong/src/domain/entities/scoreboard_player.dart';

class PingPongMatch {
  final ScoreboardPlayer playerOne;
  final ScoreboardPlayer playerTwo;
  final int playerOneScore;
  final int playerTwoScore;

  PingPongMatch(
  {
    required this.playerOne,
    required this.playerTwo,
    required this.playerOneScore,
    required this.playerTwoScore
  });
}