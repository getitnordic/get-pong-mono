import 'package:get_pong/protos/protos.dart';

import '../../../../enums/sorting_options.dart';

class RankingSorter {
  List<PlayerModel> players;

  RankingSorter(this.players);

  late bool highToLow = true;

  void toogleHighToLow() {
    highToLow ? false : true;
  }

  List<PlayerModel> sortPlayerList(SortingOptions sortingOptions) {
    switch (sortingOptions) {
      case SortingOptions.name:
        _sortByName(highToLow);
        toogleHighToLow();
        print(highToLow);
        return players;
      case SortingOptions.played:
        _sortByPlayed(highToLow);
        toogleHighToLow();
        return players;
      case SortingOptions.wins:
        _sortByWins(highToLow);
        toogleHighToLow();
        return players;
      case SortingOptions.losses:
        _sortByLosses(highToLow);
        toogleHighToLow();
        return players;
      case SortingOptions.none:
        return players;
    }
  }

  void _sortByLosses(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (b.loss).compareTo(a.loss))
        : players.sort((a, b) => (a.loss).compareTo(b.loss));
    print(players[0].fullName);
  }

  void _sortByWins(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (b.win).compareTo(a.win))
        : players.sort((a, b) => (a.win).compareTo(b.win));
  }

  void _sortByPlayed(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (b.win + b.loss).compareTo(a.win + a.loss))
        : players.sort((a, b) => (a.win + a.loss).compareTo(b.win + b.loss));
  }

  void _sortByName(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (a.fullName).compareTo(b.fullName))
        : players.sort((a, b) => (b.fullName).compareTo(a.fullName));
  }
}
