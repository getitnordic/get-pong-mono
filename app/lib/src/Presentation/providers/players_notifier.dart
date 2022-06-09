import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/sorting_options.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/services/player_service.dart';
import 'package:get_pong/src/domain/models/player.dart';
import 'package:get_pong/util/enum_mapper.dart';

class PlayersNotifier extends StateNotifier<List<Player>> {
  PlayersNotifier() : super([]);

  final service = PlayerService();

  void addPlayer(Player player) {
    state = [...state, player];
  }

  Player getPlayerById(String id) {
    return state.firstWhere((player) => player.id == id);
  }

  Future<String> fetchPlayers() async {
    print('fetching...');
    final response = await service.getPlayers();
    final List<Player> players = [];

    if (response != null) {
      for (var p in response.playerModel) {
        Player newPlayer = mapToPlayer(p);
        players.add(newPlayer);
      }
    }
    state = players;
    print('done.');
    return 'Success';
  }

  Player mapToPlayer(PlayerModel p) {
    Player newPlayer = Player(
        p.id,
        p.nickname,
        p.win,
        p.loss,
        'https://i.pravatar.cc/200',
        p.firstName,
        p.lastName,
        p.email,
        p.streak,
        p.totalScore,
        EnumMapper.getStreakEnum(p.streakEnum.toString()));
    return newPlayer;
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
    sortHighToLow
        ? state.sort((a, b) => (b.losses).compareTo(a.losses))
        : state.sort((a, b) => (a.losses).compareTo(b.losses));
    state = [...state];
  }

  void _sortByWins(bool sortHighToLow) {
    sortHighToLow
        ? state.sort((a, b) => (b.wins).compareTo(a.wins))
        : state.sort((a, b) => (a.wins).compareTo(b.wins));
    state = [...state];
  }

  void _sortByPlayed(bool sortHighToLow) {
    sortHighToLow
        ? state.sort((a, b) => (b.wins + b.losses).compareTo(a.wins + a.losses))
        : state
            .sort((a, b) => (a.wins + a.losses).compareTo(b.wins + b.losses));
    state = [...state];
  }

  void _sortByName(bool sortHighToLow) {
    sortHighToLow
        ? state.sort((a, b) => (a.nickname).compareTo(b.nickname))
        : state.sort((a, b) => (b.nickname).compareTo(a.nickname));
    state = [...state];
  }
}

final playersProvider =
    StateNotifierProvider.autoDispose<PlayersNotifier, List<Player>>(
        (ref) => PlayersNotifier());

final rankingSortingTypeProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final rankingPressedLastProvider =
    StateProvider.autoDispose<SortingOptions>((ref) => SortingOptions.none);
final matchTypeProvider =
    StateProvider.autoDispose<MatchType>((ref) => MatchType.none);
