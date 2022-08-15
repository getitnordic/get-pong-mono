import '../../../enums/match_type.dart';
import '../../../protos/protos.dart';

class ScorePageArguments {
  final List<PlayerModel> players;
  final MatchType matchType;

  ScorePageArguments({
    required this.players,
    required this.matchType,
  });
}
