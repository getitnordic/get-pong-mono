import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPlayersNotifier extends StateNotifier<List<String>> {
  SelectedPlayersNotifier() : super([]);

  void addPlayerId(String id) {
    state = [...state, id];
  }

  void removePlayerId(String id) {
    state = [
      for (final playerId in state)
        if (playerId != id) playerId,
    ];
  }
}

final selectedPlayersProvider =
StateNotifierProvider<SelectedPlayersNotifier, List<String>>((ref) {
  return SelectedPlayersNotifier();
});