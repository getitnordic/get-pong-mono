import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/player_select_choice.dart';
import '../../../protos/base.pb.dart';
import '../../core/common/common.dart';

class SelectedNotifier extends StateNotifier<List<PlayerModel>> {
  SelectedNotifier()
      : super([
          BlankPlayerModel.player,
          BlankPlayerModel.player,
          BlankPlayerModel.player,
          BlankPlayerModel.player,
        ]);

  void addPlayer(PlayerModel player) {
    state = [...state, player];
  }

  void resetState() {
    state = [
      BlankPlayerModel.player,
      BlankPlayerModel.player,
      BlankPlayerModel.player,
      BlankPlayerModel.player,
    ];
  }

  void _setPlayerOne(PlayerModel player) {
    List<PlayerModel> newSelectedList = [...state];
    newSelectedList[0] = player;
    state = newSelectedList;
  }

  void _setPlayerTwo(PlayerModel player) {
    List<PlayerModel> newSelectedList = [...state];
    newSelectedList[1] = player;
    state = newSelectedList;
  }

  void _setPlayerThree(PlayerModel player) {
    List<PlayerModel> newSelectedList = [...state];
    newSelectedList[2] = player;
    state = newSelectedList;
  }

  void _setPlayerFour(PlayerModel player) {
    List<PlayerModel> newSelectedList = [...state];
    newSelectedList[3] = player;
    state = newSelectedList;
  }

  void setPlayer(
      {required PlayerModel player,
      required PlayerSelectChoice playerSelectChoice}) {
    switch (playerSelectChoice) {
      case PlayerSelectChoice.playerOne:
        _setPlayerOne(player);
        break;
      case PlayerSelectChoice.playerTwo:
        _setPlayerTwo(player);
        break;
      case PlayerSelectChoice.playerThree:
        _setPlayerThree(player);
        break;
      case PlayerSelectChoice.playerFour:
        _setPlayerFour(player);
        break;
      case PlayerSelectChoice.none:
        break;
    }
  }
}

final selectedProvider =
    StateNotifierProvider<SelectedNotifier, List<PlayerModel>>(
        (ref) => SelectedNotifier());
