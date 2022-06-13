import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/enums/streak_enum.dart';
import 'package:get_pong/src/domain/models/player.dart';

class SelectedNotifier extends StateNotifier<List<Player>> {
  SelectedNotifier()
      : super([
          const Player(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              wins: 0,
              losses: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.none),
          const Player(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              wins: 0,
              losses: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.none),
          const Player(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              wins: 0,
              losses: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.none),
          const Player(
              id: '',
              firstName: '',
              lastName: '',
              nickname: '',
              email: '',
              wins: 0,
              losses: 0,
              totalScore: 0,
              streak: 0,
              imageUrl: '',
              streakEnum: StreakEnum.none),
        ]);

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void resetState() {
    state = [
      const Player(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          wins: 0,
          losses: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.none),
      const Player(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          wins: 0,
          losses: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.none),
      const Player(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          wins: 0,
          losses: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.none),
      const Player(
          id: '',
          firstName: '',
          lastName: '',
          nickname: '',
          email: '',
          wins: 0,
          losses: 0,
          totalScore: 0,
          streak: 0,
          imageUrl: '',
          streakEnum: StreakEnum.none),
    ];
  }

  void _setPlayerOne(Player player) {
    List<Player> newSelectedList = [...state];
    newSelectedList[0] = player;
    state = newSelectedList;
  }

  void _setPlayerTwo(Player player) {
    List<Player> newSelectedList = [...state];
    newSelectedList[1] = player;
    state = newSelectedList;
  }

  void _setPlayerThree(Player player) {
    List<Player> newSelectedList = [...state];
    newSelectedList[2] = player;
    state = newSelectedList;
  }

  void _setPlayerFour(Player player) {
    List<Player> newSelectedList = [...state];
    newSelectedList[3] = player;
    state = newSelectedList;
  }

  void setPlayer(
      {required Player player,
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

final selectedProvider = StateNotifierProvider<SelectedNotifier, List<Player>>(
    (ref) => SelectedNotifier());
