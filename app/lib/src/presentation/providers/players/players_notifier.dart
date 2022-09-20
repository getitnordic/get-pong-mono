import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../protos/base.pb.dart';
import '../../../../protos/game.pb.dart';
import '../../../core/common/common.dart';
import '../../../core/models/Scoreboard_match.dart';
import '../../../core/models/update_profile_picture_params.dart';

class PlayersNotifier extends StateNotifier<List<PlayerModel>> {
  final UseCase getPlayersUseCase;
  final UseCase registerNewPlayerUseCase;
  final UseCase updatePlayerUseCase;
  final UseCase updateProfilePictureUseCase;
  final Reader read;
  bool isLoading = false;

  PlayersNotifier(
    this.getPlayersUseCase,
    this.registerNewPlayerUseCase,
    this.updatePlayerUseCase,
    this.updateProfilePictureUseCase,
    this.read,
  ) : super([]);

  void addPlayer(PlayerModel player) async {
    // if (state.isEmpty) {
    //   await fetchPlayers();
    // }
    // sortByLastActivity();
  }

  PlayerModel getPlayerById(String id) {
    return state.firstWhere((p) => p.id == id,
        orElse: () => BlankPlayerModel.player);
  }

  Future<bool> fetchPlayers() async {
    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              state = value.data!,
            }
          else
            {
              // Do something
            }
        });
    _sortByLastActivity();

    return true;
  }

  void _sortByLastActivity() {
    state.sort((a, b) =>
        b.lastActivity.toDateTime().compareTo(a.lastActivity.toDateTime()));
  }

  Future<DataState<String>> createPlayer(PlayerModel player) async {
    addPlayer(player);
    return await registerNewPlayerUseCase(params: player);
  }

  Future<DataState<PlayerModel>> updatePlayer(PlayerModel player) async {
    return await updatePlayerUseCase(params: player);
  }

  Future<List<PlayerModel>> getTopRanks() async {
    List<PlayerModel> topRanked = [];
    const amountOfPlayersToGrab = 20;

    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              topRanked = value.data!,
            }
          else
            {}
        });
    topRanked.sort((a, b) => b.totalScore.compareTo(a.totalScore));

    return topRanked
        .where((p) => p.win + p.loss > 0)
        .take(amountOfPlayersToGrab)
        .toList();
  }

  String getPlayerRank(String playerId) {
    state.sort((a, b) => b.totalScore.compareTo(a.totalScore));
    final topRankedPlayers =
        state.where((p) => p.win + p.loss > 0).take(20).toList();

    var count = 1;
    for (var player in topRankedPlayers) {
      if (player.id == playerId) {
        return 'Rank $count';
      }
      count++;
    }
    return 'Unranked';
  }

  List<PlayerModel> getLatestPlayers() {
    _sortByLastActivity();
    return state.take(15).toList();
  }

  Future<List<PlayerModel>> getAllPlayers() async {
    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              state = value.data!,
            }
          else
            {}
        });
    _sortByLastActivity();
    return state.toList();
  }

  ScoreBoardMatch convertMatch(GameModel match) {
    final checkDouble = match.homeTeamIds.length == 2;
    return ScoreBoardMatch(
        homeTeamOne: getPlayerById(match.homeTeamIds[0]),
        homeTeamTwo: checkDouble
            ? getPlayerById(match.homeTeamIds[1])
            : BlankPlayerModel.player,
        awayTeamOne: getPlayerById(match.awayTeamIds[0]),
        awayTeamTwo: checkDouble
            ? getPlayerById(match.awayTeamIds[1])
            : BlankPlayerModel.player,
        sets: match.sets,
        isDouble: checkDouble);
  }

  Future<DataState<String>> updateProfilePicture(
      UpdateProfilePictureParams params) async {
    return await updateProfilePictureUseCase(params: params);
  }
}
