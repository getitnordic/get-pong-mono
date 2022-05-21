import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/player.dart';
// ranking: "1"
class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier() : super([]);

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void removePlayer(String playerId) {
    // state.removeWhere((p) => p.id == playerId);
    state = [
      for (final player in state)
        if (player.id != playerId) player,
    ];
  }
}

final playerProvider =
    StateNotifierProvider<PlayerNotifier, List<Player>>((ref) {
  return PlayerNotifier();
});

class SelectedPlayersNotifier extends StateNotifier<List<String>> {
  SelectedPlayersNotifier() : super([]);

  void addPlayerId(String id) {
    state = [...state, id];
  }

  void removePlayerId(String id) {
    state = [
      for (final Id in state)
        if (Id != id) Id,
    ];
  }
}

final selectedPlayersProvider =
    StateNotifierProvider<SelectedPlayersNotifier, List<String>>((ref) {
  return SelectedPlayersNotifier();
});

class Score {
  const Score({
    required this.id,
    required this.name,
    required this.score,
    // required this.ranking,
  });
  final String name;
  final String id;
  final String score;
  // final String ranking;

  Score copyWith({
    String? id,
    String? name,
    String? score,
  }) {
    return Score(
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,

      // ranking: ranking ?? this.ranking,
    );
  }
}

class ScoreNotifier extends StateNotifier<List<Score>> {
  ScoreNotifier()
      : super([
          Score(
            id: '1',
            name: 'Jesper',
            score: '21',
          )
        ]);

  void addScore(Score score) {
    state = [...state, score];
  }

  final scoreProvider =
      StateNotifierProvider<ScoreNotifier, List<Score>>((ref) {
    return ScoreNotifier();
  });
}
