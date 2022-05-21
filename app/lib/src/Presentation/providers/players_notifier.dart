import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/util/sorting_options.dart';
import '../../domain/entities/player.dart';

class PlayersNotifier extends StateNotifier<List<Player>> {

  PlayersNotifier() : super(
  [
    Player(DateTime.now().toString(), 'Göran', 10, 24, 'https://i.pravatar.cc/200?img=69'),
    Player(DateTime.now().toString(), 'Erik', 100, 34, 'https://i.pravatar.cc/200?img=68'),
    Player(DateTime.now().toString(), 'Madonna', 25, 120, 'https://i.pravatar.cc/200?img=45'),
    Player(DateTime.now().toString(), 'Emma', 245, 78, 'https://i.pravatar.cc/200?img=44'),
    Player(DateTime.now().toString(), 'Gecko', 50, 50, 'https://i.pravatar.cc/200?img=33'),
    Player(DateTime.now().toString(), 'Murarn', 8, 20, 'https://i.pravatar.cc/200?img=32'),
    Player(DateTime.now().toString(), 'Storkrökarn', 32, 32, 'https://i.pravatar.cc/200?img=14'),
    Player(DateTime.now().toString(), 'Benny', 12, 75, 'https://i.pravatar.cc/200?img=8'),
    Player(DateTime.now().toString(), 'Lucia', 100, 20, 'https://i.pravatar.cc/200?img=20'),
    Player(DateTime.now().toString(), 'Vattenmannen', 20, 100, 'https://i.pravatar.cc/200?img=7'),
    Player(DateTime.now().toString(), 'Ludwig', 85, 44, 'https://i.pravatar.cc/200?img=17'),
    Player(DateTime.now().toString(), 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
    Player(DateTime.now().toString(), 'Kocken', 65, 45, 'https://i.pravatar.cc/200?img=11'),
    Player(DateTime.now().toString(), 'Adam', 87, 0, 'https://i.pravatar.cc/200?img=12'),
    Player(DateTime.now().toString(), 'Woke', 12, 3, 'https://i.pravatar.cc/200?img=6'),
    Player(DateTime.now().toString(), 'Stefan', 8, 5, 'https://i.pravatar.cc/200?img=3'),
    Player(DateTime.now().toString(), 'Ann', 71, 25, 'https://i.pravatar.cc/200?img=30'),
  ]
  );

  void addPlayer(Player player) {
    state = [...state, player];
  }

  Player getPlayerById(String id) {
    return state.firstWhere((player) => player.id == id);
  }

  void sortPlayerList(SortingOptions sortingOptions, bool sortHighToLow) {
        switch(sortingOptions) {
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
        sortHighToLow ?
        state.sort((a, b) => (b.losses).compareTo(a.losses)):
        state.sort((a, b) => (a.losses).compareTo(b.losses));
        state = [...state];
  }

  void _sortByWins(bool sortHighToLow) {
        sortHighToLow ?
        state.sort((a, b) => (b.wins).compareTo(a.wins)):
        state.sort((a, b) => (a.wins).compareTo(b.wins));
        state = [...state];
  }

  void _sortByPlayed(bool sortHighToLow) {
        sortHighToLow ?
        state.sort((a, b) => (b.wins + b.losses).compareTo(a.wins + a.losses)):
        state.sort((a, b) => (a.wins + a.losses).compareTo(b.wins + b.losses));
        state = [...state];
  }

  void _sortByName(bool sortHighToLow) {
        sortHighToLow ?
        state.sort((a, b) => (a.name).compareTo(b.name)):
        state.sort((a, b) => (b.name).compareTo(a.name));
        state = [...state];
  }

}

final playersProvider = StateNotifierProvider<PlayersNotifier,
    List<Player>>((ref) => PlayersNotifier());

final rankingSortingTypeProvider = StateProvider<bool>((ref) => true);
final rankingPressedLastProvider = StateProvider<SortingOptions>((ref) => SortingOptions.none);