import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/protos/protos.dart';

class ScorePageArguments {
  final List<PlayerModel> players;
  final MatchType matchType;

  ScorePageArguments({
    required this.players,
    required this.matchType,
  });
}
