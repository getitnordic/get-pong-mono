import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../enums/match_type.dart';
import '../../../../enums/player_select_choice.dart';
import '../../../../protos/base.pb.dart';
import '../../../Presentation/providers/selected_players/selected_players_providers.dart';
import '../../../core/common/common.dart';
import '../../../core/models/get_win_probability_params.dart';

class SelectedPlayersController extends StateNotifier<List<PlayerModel>> {
  final UseCase getWinProb;
  final Reader read;
  SelectedPlayersController(
    this.getWinProb,
    this.read,
  ) : super(BlankPlayerModel.emptyPlayerSelect);

  void addPlayer(PlayerModel player) {
    state = [...state, player];
  }

  void resetState() {
    state = BlankPlayerModel.emptyPlayerSelect;
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

  void _updateWinProbabilitySingle() async {
    if (allSelectedSingle) {
      final params = GetWinProbabilityParams(
        homeTeamElo: state[0].totalScore,
        awayTeamElo: state[1].totalScore,
      );

      final winProbability = await getWinProb(params: params);

      read(winProbabilityProvider.notifier).state = winProbability.data!;
    }
  }

  void _updateWinProbabilityDouble() async {
    if (allSelectedDouble) {
      final homeTeamElo =
          (state[0].totalScore + state[1].totalScore / 2).toInt();
      final awayTeamElo =
          (state[2].totalScore + state[3].totalScore / 2).toInt();
      final params = GetWinProbabilityParams(
        homeTeamElo: homeTeamElo,
        awayTeamElo: awayTeamElo,
      );

      final winProbability = await getWinProb(params: params);

      read(winProbabilityProvider.notifier).state = winProbability.data!;
    }
  }

  bool duplicatesDoesNotExist() {
    final players = state;
    final newPlayers = state.toSet().toList();
    if (players.length == newPlayers.length) {
      return true;
    }
    return false;
  }

  bool get allSelectedSingle =>
      state[0].fullName.isNotEmpty &&
      state[1].fullName.isNotEmpty &&
      state[0].id != state[1].id;

  bool get allSelectedDouble =>
      state[0].fullName.isNotEmpty &&
      state[1].fullName.isNotEmpty &&
      state[2].fullName.isNotEmpty &&
      state[3].fullName.isNotEmpty;

  void setPlayer({
    required PlayerModel player,
    required PlayerSelectChoice playerSelectChoice,
  }) {
    switch (playerSelectChoice) {
      case PlayerSelectChoice.playerOne:
        _setPlayerOne(player);
        if (read(matchTypeProvider) == MatchType.single) {
          _updateWinProbabilitySingle();
        }
        if (read(matchTypeProvider) == MatchType.double) {
          _updateWinProbabilityDouble();
        }
        break;
      case PlayerSelectChoice.playerTwo:
        _setPlayerTwo(player);
        if (read(matchTypeProvider) == MatchType.single) {
          _updateWinProbabilitySingle();
        }
        if (read(matchTypeProvider) == MatchType.double) {
          _updateWinProbabilityDouble();
        }
        break;
      case PlayerSelectChoice.playerThree:
        _setPlayerThree(player);
        if (read(matchTypeProvider) == MatchType.single) {
          _updateWinProbabilitySingle();
        }
        if (read(matchTypeProvider) == MatchType.double) {
          _updateWinProbabilityDouble();
        }
        break;
      case PlayerSelectChoice.playerFour:
        _setPlayerFour(player);
        if (read(matchTypeProvider) == MatchType.single) {
          _updateWinProbabilitySingle();
        }
        if (read(matchTypeProvider) == MatchType.double) {
          _updateWinProbabilityDouble();
        }
        break;
      case PlayerSelectChoice.none:
        break;
    }
  }
}
