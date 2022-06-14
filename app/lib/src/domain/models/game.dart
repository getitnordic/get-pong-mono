import 'package:get_pong/protos/base.pb.dart';

class Game {
  final List<PlayerModel> teamOne;
  final List<PlayerModel> teamTwo;
  final int teamOneScore;
  final int teamTwoScore;

  Game(
      {required this.teamOne,
      required this.teamTwo,
      required this.teamOneScore,
      required this.teamTwoScore});
}
