import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/register_services.dart';
import 'package:get_pong/src/core/common/common.dart';

import '../../domain/use_cases/use_cases.dart';

class PlayersNotifier extends StateNotifier<List<PlayerModel>> {
  final GetPlayers getPlayers;
  final AddPlayer registerNewPlayer;

  PlayersNotifier(this.getPlayers, this.registerNewPlayer) : super([]);

  void addPlayer(PlayerModel player) {
    state = [...state, player];
  }

  PlayerModel getPlayerById(String id) {
    return state.firstWhere((player) => player.id == id);
  }

  Future<List<PlayerModel>> fetchPlayers() async {
    final response = await getPlayers(params: EmptyParams());

    List<PlayerModel> players = [];

    if (response is DataSuccess) {
      players = response.data!;
    }

    state = players;

    return state;
  }

  Future<DataState<String>> createPlayer(PlayerModel player) async {
    return await registerNewPlayer(params: player);
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

final playersProvider =
    StateNotifierProvider<PlayersNotifier, List<PlayerModel>>(
        (ref) => PlayersNotifier(getIt<GetPlayers>(), getIt<AddPlayer>()));

final rankingSortingTypeProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final rankingPressedLastProvider =
    StateProvider.autoDispose<SortingOptions>((ref) => SortingOptions.none);
final matchTypeProvider =
    StateProvider.autoDispose<MatchType>((ref) => MatchType.none);
