import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/util/sorting_options.dart';
import '../../domain/entities/player.dart';

class PlayersNotifier extends StateNotifier<List<Player>> {

  PlayersNotifier() : super(
  [
    Player('1', 'Göran', 10, 24, 'https://i.pravatar.cc/200?img=69'),
    Player('2', 'Erik', 100, 34, 'https://i.pravatar.cc/200?img=68'),
    Player('3', 'Madonna', 25, 120, 'https://i.pravatar.cc/200?img=45'),
    Player('4', 'Emma', 245, 78, 'https://i.pravatar.cc/200?img=44'),
    Player('5', 'Gecko', 50, 50, 'https://i.pravatar.cc/200?img=33'),
    Player('6', 'Murarn', 8, 20, 'https://i.pravatar.cc/200?img=32'),
    Player('7', 'Storkrökarn', 32, 32, 'https://i.pravatar.cc/200?img=14'),
    Player('8', 'Benny', 12, 75, 'https://i.pravatar.cc/200?img=8'),
    Player('9', 'Lucia', 100, 20, 'https://i.pravatar.cc/200?img=20'),
    Player('10', 'Vattenmannen', 20, 100, 'https://i.pravatar.cc/200?img=7'),
    Player('11', 'Ludwig', 85, 44, 'https://i.pravatar.cc/200?img=17'),
    Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
    Player('13', 'Kocken', 65, 45, 'https://i.pravatar.cc/200?img=11'),
    Player('14', 'Adam', 87, 0, 'https://i.pravatar.cc/200?img=12'),
    Player('15', 'Woke', 12, 3, 'https://i.pravatar.cc/200?img=6'),
    Player('16', 'Stefan', 8, 5, 'https://i.pravatar.cc/200?img=3'),
    Player('17', 'Ann', 71, 25, 'https://i.pravatar.cc/200?img=30'),
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