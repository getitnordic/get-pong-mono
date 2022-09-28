import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/sorting_options.dart';
import '../../../protos/protos.dart';
import '../../core/common/common.dart';
import '../providers/top_ranks_providers.dart';

class TopRanksController extends StateNotifier<List<PlayerModel>> {
  final UseCase getPlayersUseCase;
  final Reader read;

  TopRanksController(this.getPlayersUseCase, this.read) : super([]) {
    fetchPlayers();
  }

  bool _highToLow = true;
  SortingOptions _lastPressed = SortingOptions.none;

  void _setLoading(bool value) {
    read(topRanksLoadingProvider.notifier).update((state) => value);
  }

  Future<bool> fetchPlayers() async {
    _setLoading(true);
    List<PlayerModel> data = [];
    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              data = value.data!,
              data.sort((a, b) => b.lastActivity
                  .toDateTime()
                  .compareTo(a.lastActivity.toDateTime())),
              state = data.where((p) => p.win + p.loss > 0).take(20).toList(),
            }
          else
            {
              // Do something
            }
        });
    _sortByScore();
    _setLoading(false);
    return true;
  }

  List<PlayerModel> sortPlayerList(SortingOptions sortingOptions) {
    switch (sortingOptions) {
      case SortingOptions.name:
        if (_lastPressed != SortingOptions.name) {
          _setHighToLow(true);
        }
        _sortByName();
        _setLastPressed(SortingOptions.name);
        _toggleHighToLow();
        return state;
      case SortingOptions.played:
        if (_lastPressed != SortingOptions.played) {
          _setHighToLow(true);
        }
        _sortByPlayed();
        _setLastPressed(SortingOptions.played);
        _toggleHighToLow();
        return state;
      case SortingOptions.wins:
        if (_lastPressed != SortingOptions.wins) {
          _setHighToLow(true);
        }
        _sortByWins();
        _setLastPressed(SortingOptions.wins);
        _toggleHighToLow();
        return state;
      case SortingOptions.losses:
        if (_lastPressed != SortingOptions.losses) {
          _setHighToLow(true);
        }
        _sortByLosses();
        _setLastPressed(SortingOptions.losses);
        _toggleHighToLow();
        return state;
      case SortingOptions.score:
        if (_lastPressed != SortingOptions.score) {
          _setHighToLow(true);
        }
        _sortByScore();
        _setLastPressed(SortingOptions.score);
        _toggleHighToLow();
        return state;
      case SortingOptions.none:
        return state;
    }
  }

  void _sortByLosses() {
    _highToLow
        ? state.sort((a, b) => (b.loss).compareTo(a.loss))
        : state.sort((a, b) => (a.loss).compareTo(b.loss));
  }

  void _sortByWins() {
    _highToLow
        ? state.sort((a, b) => (b.win).compareTo(a.win))
        : state.sort((a, b) => (a.win).compareTo(b.win));
  }

  void _sortByPlayed() {
    _highToLow
        ? state.sort((a, b) => (b.win + b.loss).compareTo(a.win + a.loss))
        : state.sort((a, b) => (a.win + a.loss).compareTo(b.win + b.loss));
  }

  void _sortByName() {
    _highToLow
        ? state.sort((a, b) => (a.fullName).compareTo(b.fullName))
        : state.sort((a, b) => (b.fullName).compareTo(a.fullName));
  }

  void _sortByScore() {
    _highToLow
        ? state.sort((a, b) => (b.totalScore).compareTo(a.totalScore))
        : state.sort((a, b) => (a.totalScore).compareTo(b.totalScore));
  }

  void _toggleHighToLow() {
    _highToLow = !_highToLow;
  }

  void _setHighToLow(bool value) {
    _highToLow = value;
  }

  void _setLastPressed(SortingOptions option) {
    _lastPressed = option;
  }
}
