import 'dart:collection';

import '../../../protos/protos.dart';
import '../widgets/stats_page/day.dart';
import '../widgets/stats_page/player_stat.dart';

class ResultStatsController {
  final List<ResultModel> results;
  final List<PlayerModel> players;
  final List<GameModel> games;

  ResultStatsController({
    required this.results,
    required this.players,
    required this.games,
  });

  int getAmountOfGames() {
    return _getRecentGames().length;
  }

  int getPlayerCount() {
    final playerSet = HashSet<String>();
    final recentGames = _getRecentGames();
    for (var game in recentGames) {
      playerSet.add(game.homeTeamIds[0]);
      playerSet.add(game.awayTeamIds[0]);
      if (game.homeTeamIds.length == 2) {
        playerSet.add(game.homeTeamIds[1]);
        playerSet.add(game.awayTeamIds[1]);
      }
    }
    return playerSet.length;
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

  String playerWithMostPlayedGames() {
    return players
        .firstWhere((p) => p.id == _playerWithMostPlayedGamesId())
        .fullName;
  }

  String _playerWithMostPlayedGamesId() {
    String mostPlayedId = '';
    int maxCount = -1;
    final resultHash = _getRecentResults();

    var playedGames = <String, int>{};
    for (var result in resultHash) {
      int count = playedGames.update(result.playerId, (value) => value + 1,
          ifAbsent: () => 1);
      if (count > maxCount) {
        maxCount = count;
        mostPlayedId = result.playerId;
      }
    }
    return players.firstWhere((p) => p.id == mostPlayedId).id;
  }

  int playerWithMostPlayedGamesAmount() {
    int count = 0;
    final playerWithMostGamesId = _playerWithMostPlayedGamesId();
    for (var game in games) {
      if (game.homeTeamIds[0] == playerWithMostGamesId ||
          game.awayTeamIds[0] == playerWithMostGamesId) {
        count++;
      }
    }
    return count;
  }

  List<Day> getAmountOfGamesPerDay() {
    final days = [
      Day('Mondays'),
      Day('Tuesdays'),
      Day('Wednesdays'),
      Day('Thursdays'),
      Day('Fridays'),
      Day('Saturdays'),
      Day('Sundays'),
    ];

    final recentGames = _getRecentGames();

    for (var game in recentGames) {
      switch (game.timeStamp.toDateTime().weekday) {
        case 1:
          days[0].addCount();
          break;
        case 2:
          days[1].addCount();
          break;
        case 3:
          days[2].addCount();
          break;
        case 4:
          days[3].addCount();
          break;
        case 5:
          days[4].addCount();
          break;
        case 6:
          days[5].addCount();
          break;
        case 7:
          days[6].addCount();
          break;
      }
    }
    return days;
  }

  List<GameModel> _getRecentGames() {
    final recentGames = games
        .where((g) => g.timeStamp
            .toDateTime()
            .isAfter(DateTime.now().subtract(const Duration(days: 30))))
        .toList();
    return recentGames;
  }

  HashSet<ResultModel> _getRecentResults() {
    final resultHash = HashSet<ResultModel>();

    for (final result in results) {
      if (result.timeStamp
          .toDateTime()
          .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
        resultHash.add(result);
      }
    }
    return resultHash;
  }

  List<PlayerStat> playersWithMostGames() {
    List<PlayerStat> playersWithMostGames = [];
    final recentGames = _getRecentGames();
    var playersMap = <String, int>{};
    for (var game in recentGames) {
      playersMap.update(game.homeTeamIds[0], (value) => value + 1,
          ifAbsent: () => 1);
      playersMap.update(game.awayTeamIds[0], (value) => value + 1,
          ifAbsent: () => 1);
      if (game.awayTeamIds.length == 2) {
        playersMap.update(game.homeTeamIds[1], (value) => value + 1,
            ifAbsent: () => 1);
        playersMap.update(game.awayTeamIds[1], (value) => value + 1,
            ifAbsent: () => 1);
      }
    }
    for (var i = 0; i < playersMap.length; i++) {
      final playerToAdd =
          players.firstWhere((p) => p.id == playersMap.keys.elementAt(i));
      final gameCount = playersMap.values.elementAt(i);
      playersWithMostGames.add(
        PlayerStat(
          player: playerToAdd,
          statCount: gameCount,
        ),
      );
    }

    return _getSortedPlayerStats(playersWithMostGames).reversed.toList();
  }

  List<PlayerStat> playersWithMostWins() {
    List<PlayerStat> playersWithMostWins = [];
    final recentResults = _getRecentResults();
    var playersMap = <String, int>{};
    for (var result in recentResults) {
      if (result.gameWon) {
        playersMap.update(result.playerId, (value) => value + 1,
            ifAbsent: () => 1);
      }
    }
    for (var i = 0; i < playersMap.length; i++) {
      final playerToAdd =
          players.firstWhere((p) => p.id == playersMap.keys.elementAt(i));
      final winCount = playersMap.values.elementAt(i);
      playersWithMostWins.add(
        PlayerStat(
          player: playerToAdd,
          statCount: winCount,
        ),
      );
    }

    return _getSortedPlayerStats(playersWithMostWins).reversed.toList();
  }

  List<PlayerStat> playersWithMostEloGained() {
    List<PlayerStat> playersWithMostEloGained = [];
    final recentResults = _getRecentResults();
    var playersMap = <String, int>{};
    for (var result in recentResults) {
      playersMap.update(result.playerId, (value) => value + result.eloDiff,
          ifAbsent: () => result.eloDiff);
    }
    for (var i = 0; i < playersMap.length; i++) {
      final playerToAdd =
          players.firstWhere((p) => p.id == playersMap.keys.elementAt(i));
      final eloCount = playersMap.values.elementAt(i);
      playersWithMostEloGained.add(
        PlayerStat(
          player: playerToAdd,
          statCount: eloCount > 0 ? eloCount : 0,
        ),
      );
    }

    return _getSortedPlayerStats(playersWithMostEloGained).reversed.toList();
  }

  List<PlayerStat> _getSortedPlayerStats(List<PlayerStat> players) {
    players.sort((a, b) => b.statCount.compareTo(a.statCount));
    final playersToReturn = players.take(5).toList();
    playersToReturn.sort((a, b) => b.statCount.compareTo(a.statCount));
    return playersToReturn;
  }
}
