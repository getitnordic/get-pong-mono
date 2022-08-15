import '../../../../enums/sorting_options.dart';
import '../../../../protos/protos.dart';

class RankingSorter {
  List<PlayerModel> players;
  RankingSorter(
    this.players,
  );

  List<PlayerModel> sortPlayerList(
      SortingOptions sortingOptions, bool highToLow) {
    switch (sortingOptions) {
      case SortingOptions.name:
        _sortByName(highToLow);
        return players;
      case SortingOptions.played:
        _sortByPlayed(highToLow);
        return players;
      case SortingOptions.wins:
        _sortByWins(highToLow);
        return players;
      case SortingOptions.losses:
        _sortByLosses(highToLow);
        return players;
      case SortingOptions.score:
        _sortByScore(highToLow);
        return players;
      case SortingOptions.none:
        return players;
    }
  }

  void _sortByLosses(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (b.loss).compareTo(a.loss))
        : players.sort((a, b) => (a.loss).compareTo(b.loss));
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

  void _sortByScore(bool sortHighToLow) {
    sortHighToLow
        ? players.sort((a, b) => (b.totalScore).compareTo(a.totalScore))
        : players.sort((a, b) => (a.totalScore).compareTo(b.totalScore));
  }
}
