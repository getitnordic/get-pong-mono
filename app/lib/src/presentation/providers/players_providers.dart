import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../../protos/base.pb.dart';
import '../../../register_services.dart';
import '../../domain/use_cases/players/players.dart';
import '../controllers/players_controller.dart';

final playersProvider =
    StateNotifierProvider<PlayersController, List<PlayerModel>>((ref) =>
        PlayersController(
            locator<GetPlayersUseCase>(),
            locator<AddPlayerUseCase>(),
            locator<UpdatePlayerUseCase>(),
            locator<UpdateProfilePictureUseCase>(),
            ref.read));

final playerListProvider =
    FutureProvider.autoDispose<List<PlayerModel>>((ref) async {
  final players =
      await locator<GetPlayersUseCase>().call(params: EmptyParams());
  return players.data!;
});

final playerRankProvider =
    FutureProvider.family.autoDispose<String, String>((ref, id) async {
  final response =
      await locator<GetPlayersUseCase>().call(params: EmptyParams());
  final players = response.data!;

  players.sort((a, b) => b.totalScore.compareTo(a.totalScore));

  final topRankedPlayers =
      players.where((p) => p.win + p.loss > 0).take(20).toList();

  var count = 1;
  for (var player in topRankedPlayers) {
    if (player.id == id) {
      return 'Rank $count';
    }
    count++;
  }
  return 'Unranked';
});

final playersLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
