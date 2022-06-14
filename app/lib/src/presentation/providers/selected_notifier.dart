import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/protos/base.pb.dart';

class SelectedNotifier extends StateNotifier<List<PlayerModel>> {
  SelectedNotifier()
      : super([
          PlayerModel(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              win: 0,
              loss: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.NONE),
          PlayerModel(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              win: 0,
              loss: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.NONE),
          PlayerModel(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              win: 0,
              loss: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.NONE),
          PlayerModel(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              win: 0,
              loss: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.NONE),
        ]);

  void addPlayer(PlayerModel player) {
    state = [...state, player];
  }

  void resetState() {
    state = [
      PlayerModel(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          win: 0,
          loss: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.NONE),
      PlayerModel(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          win: 0,
          loss: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.NONE),
      PlayerModel(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          win: 0,
          loss: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.NONE),
      PlayerModel(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          win: 0,
          loss: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.NONE),
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
