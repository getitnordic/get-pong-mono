import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/protos/google/protobuf/timestamp.pb.dart';
import 'package:get_pong/register_services.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../domain/use_cases/use_cases.dart';

final playersProvider =
    StateNotifierProvider<PlayersNotifier, List<PlayerModel>>((ref) =>
        PlayersNotifier(
            getIt<GetPlayersUseCase>(), getIt<AddPlayerUseCase>(), ref.read));

final playersLoadingProvider = StateProvider<bool>((ref) => false);

final rankingSortingTypeProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final rankingPressedLastProvider =
    StateProvider.autoDispose<SortingOptions>((ref) => SortingOptions.none);
final matchTypeProvider =
    StateProvider.autoDispose<MatchType>((ref) => MatchType.none);

class PlayersNotifier extends StateNotifier<List<PlayerModel>> {
  final GetPlayersUseCase getPlayersUseCase;
  final AddPlayerUseCase registerNewPlayerUseCase;
  final Reader read;

  PlayersNotifier(
      this.getPlayersUseCase, this.registerNewPlayerUseCase, this.read)
      : super([]);

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

  void sortPlayerList(SortingOptions sortingOptions, bool sortHighToLow) {
    switch (sortingOptions) {
      case SortingOptions.name:
        _sortByName(sortHighToLow);
        break;
      case SortingOptions.played:
        _sortByPlayed(sortHighToLow);
        break;
      case SortingOptions.wins:
        _sortByWins(sortHighToLow);
        break;
      case SortingOptions.losses:
        _sortByLosses(sortHighToLow);
        break;
      case SortingOptions.none:
        break;
    }
  }

  void _sortByLosses(bool sortHighToLow) {
    print('Length: ${state.length}');
    sortHighToLow
        ? state.sort((a, b) => (b.loss).compareTo(a.loss))
        : state.sort((a, b) => (a.loss).compareTo(b.loss));
    state = [...state];
  }

  void _sortByWins(bool sortHighToLow) {
    print('Length: ${state.length}');
    sortHighToLow
        ? state.sort((a, b) => (b.win).compareTo(a.win))
        : state.sort((a, b) => (a.win).compareTo(b.win));
    state = [...state];
  }

  void _sortByPlayed(bool sortHighToLow) {
    print('Length: ${state.length}');
    sortHighToLow
        ? state.sort((a, b) => (b.win + b.loss).compareTo(a.win + a.loss))
        : state.sort((a, b) => (a.win + a.loss).compareTo(b.win + b.loss));
    state = [...state];
  }

  void _sortByName(bool sortHighToLow) {
    print('Length: ${state.length}');
    sortHighToLow
        ? state.sort((a, b) => (a.nickname).compareTo(b.nickname))
        : state.sort((a, b) => (b.nickname).compareTo(a.nickname));
    state = [...state];
  }
}
