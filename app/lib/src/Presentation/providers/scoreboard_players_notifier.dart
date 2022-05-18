import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/util/sorting_options.dart';
import '../../domain/entities/scoreboard_player.dart';

class ScoreboardPlayersNotifier extends StateNotifier<List<ScoreboardPlayer>> {

  ScoreboardPlayersNotifier() : super(
      [
            ScoreboardPlayer('Göran', 10, 24),
            ScoreboardPlayer('Erik', 100, 34),
            ScoreboardPlayer('Madonna', 25, 120),
            ScoreboardPlayer('Emma', 245, 78),
            ScoreboardPlayer('Gecko', 50, 50),
            ScoreboardPlayer('Murarn', 8, 20),
            ScoreboardPlayer('Storkrökarn', 32, 32),
            ScoreboardPlayer('Benny', 12, 75),
            ScoreboardPlayer('Lucia', 100, 20),
            ScoreboardPlayer('Vattenmannen', 20, 100),
            ScoreboardPlayer('Ludwig', 85, 44),
            ScoreboardPlayer('Brad Pitt', 78, 25),
            ScoreboardPlayer('Kocken', 65, 45),
            ScoreboardPlayer('Adam', 87, 0),
            ScoreboardPlayer('Woke', 12, 3),
            ScoreboardPlayer('Stefan', 8, 5),
            ScoreboardPlayer('Ann', 71, 25),
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