import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/util/sorting_options.dart';
import '../../domain/entities/scoreboard_player.dart';

class ScoreboardPlayersNotifier extends StateNotifier<List<ScoreboardPlayer>> {

  ScoreboardPlayersNotifier() : super(
      [
        const ScoreboardPlayer('Göran', 10, 24, 'https://i.pravatar.cc/100?img=69'),
        const ScoreboardPlayer('Erik', 100, 34, 'https://i.pravatar.cc/100?img=68'),
        const ScoreboardPlayer('Madonna', 25, 120, 'https://i.pravatar.cc/100?img=45'),
        const ScoreboardPlayer('Emma', 245, 78, 'https://i.pravatar.cc/100?img=44'),
        const ScoreboardPlayer('Gecko', 50, 50, 'https://i.pravatar.cc/100?img=33'),
        const ScoreboardPlayer('Murarn', 8, 20, 'https://i.pravatar.cc/100?img=32'),
        const ScoreboardPlayer('Storkrökarn', 32, 32, 'https://i.pravatar.cc/100?img=14'),
        const ScoreboardPlayer('Benny', 12, 75, 'https://i.pravatar.cc/100?img=8'),
        const ScoreboardPlayer('Lucia', 100, 20, 'https://i.pravatar.cc/100?img=20'),
        const ScoreboardPlayer('Vattenmannen', 20, 100, 'https://i.pravatar.cc/100?img=7'),
        const ScoreboardPlayer('Ludwig', 85, 44, 'https://i.pravatar.cc/100?img=17'),
        const ScoreboardPlayer('Brad Pitt', 78, 25, 'https://i.pravatar.cc/100?img=69'),
        const ScoreboardPlayer('Kocken', 65, 45, 'https://i.pravatar.cc/100?img=11'),
        const ScoreboardPlayer('Adam', 87, 0, 'https://i.pravatar.cc/100?img=12'),
        const ScoreboardPlayer('Woke', 12, 3, 'https://i.pravatar.cc/100?img=6'),
        const ScoreboardPlayer('Stefan', 8, 5, 'https://i.pravatar.cc/100?img=3'),
        const ScoreboardPlayer('Ann', 71, 25, 'https://i.pravatar.cc/100?img=30'),
      ]
  );

  void addPlayer(ScoreboardPlayer player) {
    state = [...state, player];
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

final scoreboardPlayerProvider = StateNotifierProvider<ScoreboardPlayersNotifier,
    List<ScoreboardPlayer>>((ref) => ScoreboardPlayersNotifier());

final scoreboardSortingTypeProvider = StateProvider<bool>((ref) => true);
final scoreboardPressedLastProvider = StateProvider<SortingOptions>((ref) => SortingOptions.none);