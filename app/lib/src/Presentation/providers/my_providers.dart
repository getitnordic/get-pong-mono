import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Player {
  const Player({
    required this.name,
    required this.email,
    required this.id,
  });
  final String name;
  final String email;
  final String id;

  Player copyWith({String? name, String? email, String? id}) {
    return Player(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier()
      : super([Player(name: 'olof', email: 'email@test.com', id: '1')]);

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