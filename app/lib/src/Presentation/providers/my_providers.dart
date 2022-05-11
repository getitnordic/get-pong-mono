import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Player {
  const Player({
    required this.name,
    required this.email,
    required this.id,
    required this.score,
    // required this.ranking,
  });
  final String name;
  final String email;
  final String id;
  final String score;
  // final String ranking;

  Player copyWith({String? name, String? email, String? id, String? score}) {
    return Player(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      score: score ?? this.score,

      // ranking: ranking ?? this.ranking,
    );
  }
}

// ranking: "1"
class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier()
      : super([
          Player(name: 'olof', email: 'email@test.com', id: '1', score: '2')
        ]);

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

final bottomBarIndexProvider = StateProvider<int>((ref) {
  return 0;
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
