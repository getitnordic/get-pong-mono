import 'package:get_pong/src/domain/entities/player.dart';

class PingPongMatch {
  final Player playerOne;
  final Player playerTwo;
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