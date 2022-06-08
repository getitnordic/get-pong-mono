import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPlayersNotifier extends StateNotifier<List<String>> {
  SelectedPlayersNotifier() : super([
    '',
    '',
    '',
    ''
  ]);

  void addPlayerId(String id) {
    state = [...state, id];
  }

  void removePlayerId(String id) {
    state = [
      for (final playerId in state)
        if (playerId != id) playerId,
    ];
  }

  void selectNone() {
    state = [
      '',
      '',
      '',
      ''
    ];
  }

  void setPlayerOne(String id) {
    List<String> newSelectedList = [...state];
    newSelectedList[0] = id;
    state = newSelectedList;
  }

  void setPlayerTwo(String id) {

  }

}

final selectedPlayersProvider =
StateNotifierProvider<SelectedPlayersNotifier, List<String>>((ref) {
  return SelectedPlayersNotifier();
});