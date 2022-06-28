import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/register_services.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../../protos/game.pb.dart';
import '../../core/models/models.dart';
import '../../domain/use_cases/use_cases.dart';

final playersProvider =
    StateNotifierProvider<PlayersNotifier, List<PlayerModel>>((ref) =>
        PlayersNotifier(getIt<GetPlayersUseCase>(), getIt<AddPlayerUseCase>(),
            getIt<UpdatePlayerUseCase>(), ref.read));

final playersLoadingProvider = StateProvider<bool>((ref) => false);

final rankingSortingTypeProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final rankingPressedLastProvider =
    StateProvider.autoDispose<SortingOptions>((ref) => SortingOptions.none);
final matchTypeProvider =
    StateProvider.autoDispose<MatchType>((ref) => MatchType.none);

final topRanksProvider =
    FutureProvider.autoDispose<List<PlayerModel>>((ref) async {
  return ref.read(playersProvider.notifier).getTopRanks();
});

class PlayersNotifier extends StateNotifier<List<PlayerModel>> {
  final GetPlayersUseCase getPlayersUseCase;
  final AddPlayerUseCase registerNewPlayerUseCase;
  final UpdatePlayerUseCase updatePlayerUseCase;
  final Reader read;
  bool isLoading = false;

  PlayersNotifier(
    this.getPlayersUseCase,
    this.registerNewPlayerUseCase,
    this.updatePlayerUseCase,
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

  Future<void> fetchPlayers() async {
    setPlayersLoading(true);

    // if (state.isNotEmpty) {
    //   setPlayersLoading(false);
    //   sortByLastActivity();
    //   return;
    // }

    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              setPlayersLoading(false),
              state = value.data!,
            }
          else
            {setPlayersLoading(false), print(value.error)}
        });
    sortByLastActivity();
  }

  void sortByLastActivity() {
    state.sort((a, b) =>
        b.lastActivity.toDateTime().compareTo(a.lastActivity.toDateTime()));
  }

  void setPlayersLoading(bool loadingState) {
    read(playersLoadingProvider.notifier).state = loadingState;
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
              setPlayersLoading(false),
              topRanked = value.data!,
            }
          else
            {print(value.error)}
        });
    topRanked.sort((a, b) => b.totalScore.compareTo(a.totalScore));
    return topRanked
        .where((p) => p.win + p.loss > 0)
        .take(amountOfPlayersToGrab)
        .toList();
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
}
