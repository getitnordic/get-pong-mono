import 'package:get_pong/src/domain/models/player.dart';

class Game {
  final List<Player> teamOne;
  final List<Player> teamTwo;
  final int teamOneScore;
  final int teamTwoScore;

  Game(
      {required this.teamOne,
      required this.teamTwo,
      required this.teamOneScore,
      required this.teamTwoScore});
}
