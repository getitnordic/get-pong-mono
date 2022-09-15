import '../../../../protos/base.pb.dart';
import '../../../../protos/game.pb.dart';
import '../../../../protos/result.pb.dart';
import '../../../../utils/extensions/compare_date.dart';

class PlayerStatsController {
  final PlayerModel player;
  final List<ResultModel> results;
  final List<GameModel> games;

  PlayerStatsController({
    required this.player,
    required this.results,
    required this.games,
  });

  int getAmountOfGames() {
    return _getRecentGames().length;
  }

  int getAmountOfWins() {
    return _getRecentResults().where((r) => r.gameWon).length;
  }

  int getAmountOfLosses() {
    return _getRecentResults().where((r) => !r.gameWon).length;
  }

  String getWinRate() {
    return '${(_getRecentResults().where((r) => r.gameWon).length / _getRecentGames().length * 100).floor()}%';
  }

  List<GameModel> _getRecentGames() {
    final recentGames = games
        .where((g) => g.timeStamp
            .toDateTime()
            .isAfter(DateTime.now().subtract(const Duration(days: 30))))
        .toList();
    return recentGames;
  }

  List<ResultModel> _getRecentResults() {
    final recentResults = results
        .where((g) => g.timeStamp
            .toDateTime()
            .isAfter(DateTime.now().subtract(const Duration(days: 30))))
        .toList();
    return recentResults;
  }

  int getSingles() {
    final recentGames = _getRecentGames();
    int singles = 0;
    for (var game in recentGames) {
      if (game.awayTeamIds.length == 1) {
        singles++;
      }
    }
    return singles;
  }

  int getDoubles() {
    final recentGames = _getRecentGames();
    int doubles = 0;
    for (var game in recentGames) {
      if (game.awayTeamIds.length == 2) {
        doubles++;
      }
    }
    return doubles;
  }

  int getAmountOfSets() {
    final recentGames = _getRecentGames();
    int sets = 0;
    for (var game in recentGames) {
      sets += game.sets.length;
    }
    return sets;
  }

  String getAverageSets() {
    final recentGames = _getRecentGames();
    int sets = 0;
    for (var game in recentGames) {
      sets += game.sets.length;
    }
    return (sets / recentGames.length).toStringAsFixed(1);
  }

  int getAmountOfPoints() {
    final recentGames = _getRecentGames();
    int points = 0;
    for (var game in recentGames) {
      for (var set in game.sets) {
        points += set.homeTeam;
        points += set.awayTeam;
      }
    }
    return points;
  }

  String getAveragePoints() {
    final recentGames = _getRecentGames();
    int points = 0;
    for (var game in recentGames) {
      for (var set in game.sets) {
        points += set.homeTeam;
        points += set.awayTeam;
      }
    }
    return (points / recentGames.length).toStringAsFixed(0);
  }

  List<int> getEloData() {
    final recentResults = _getRecentResults().reversed.toList();
    List<int> data = [];
    int latestElo = recentResults[0].newElo;
    if (results[0]
        .timeStamp
        .toDateTime()
        .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
      latestElo = 1000;
    }

    for (var i = 29; i >= 0; i--) {
      for (var result in recentResults) {
        if (result.timeStamp
            .toDateTime()
            .hasSameDate(DateTime.now().subtract(Duration(days: i)))) {
          latestElo = result.newElo;
        }
      }
      data.add(latestElo);
    }

    return data;
  }
}
