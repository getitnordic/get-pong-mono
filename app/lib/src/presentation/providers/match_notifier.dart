import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';

class MatchNotifier extends StateNotifier<List<GameModel>> {
  MatchNotifier() : super([]);

  void addMatch(GameModel match) {
    state = [...state, match];
  }

  List<GameModel> getMatchesByPlayerId(String id) {
    List<GameModel> matches = [];
    for (GameModel match in state) {
      if (match.homeTeamIds[0] == id) {
        matches.add(match);
      }
      if (match.awayTeamIds[0] == id) {
        matches.add(match);
      }
    }
    return matches;
  }
}

final matchProvider = StateNotifierProvider<MatchNotifier, List<GameModel>>(
    (ref) => MatchNotifier());
