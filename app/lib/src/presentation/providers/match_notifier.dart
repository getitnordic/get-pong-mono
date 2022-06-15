import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/domain/models/game.dart';

class MatchNotifier extends StateNotifier<List<Game>> {
  MatchNotifier() : super([]);

  void addMatch(Game match) {
    state = [...state, match];
  }

  List<Game> getMatchesByPlayerId(String id) {
    List<Game> matches = [];
    for (Game match in state) {
      if (match.teamOne[0].id == id) {
        matches.add(match);
      }
      if (match.teamTwo[0].id == id) {
        matches.add(match);
      }
    }
    return matches;
  }
}

final singleMatchProvider =
    StateNotifierProvider<MatchNotifier, List<Game>>((ref) => MatchNotifier());