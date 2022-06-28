import '../../../../../enums/team.dart';
import '../../../../../protos/base.pb.dart';
import '../../../../../protos/game.pb.dart';
import '../../../../core/models/match_result.dart';

class ScoreboardController {
  final PlayerModel homeTeamOne;
  final PlayerModel homeTeamTwo;
  final PlayerModel awayTeamOne;
  final PlayerModel awayTeamTwo;
  final GameModel match;

  ScoreboardController({
    required this.homeTeamOne,
    required this.homeTeamTwo,
    required this.awayTeamOne,
    required this.awayTeamTwo,
    required this.match,
  });

  int getAmountOfSets() {
    if (match.sets.length == 3) {
      return 3;
    }
    if (match.sets.length == 5) {
      return 5;
    }
    return 1;
  }

  int setsNeededToWin() {
    int sets = 0;
    int homeTeamScore = 0;
    int awayTeamScore = 0;

    if (match.sets.length == 3) {
      for (final set in match.sets) {
        sets++;
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
        if (homeTeamScore == 2 || awayTeamScore == 2) {
          return sets;
        }
      }
    }
    if (match.sets.length == 5) {
      for (final set in match.sets) {
        sets++;
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
        if (homeTeamScore == 3 || awayTeamScore == 3) {
          return sets;
        }
      }
    }
    return 1;
  }

  MatchResult getMatchScore() {
    int homeTeamScore = 0;
    int awayTeamScore = 0;

    if (match.sets.length == 1) {
      for (final set in match.sets) {
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
      }
    }

    if (match.sets.length == 3) {
      for (final set in match.sets) {
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
        if (homeTeamScore == 2 || awayTeamScore == 2) {
          return MatchResult(
              homeTeamScore: homeTeamScore,
              awayTeamScore: awayTeamScore,
              winner: homeTeamScore > awayTeamScore
                  ? Team.homeTeam
                  : Team.awayTeam);
        }
      }
    }
    if (match.sets.length == 5) {
      for (final set in match.sets) {
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
        if (homeTeamScore == 3 || awayTeamScore == 3) {
          return MatchResult(
              homeTeamScore: homeTeamScore,
              awayTeamScore: awayTeamScore,
              winner: homeTeamScore > awayTeamScore
                  ? Team.homeTeam
                  : Team.awayTeam);
        }
      }
    }
    return MatchResult(
        homeTeamScore: homeTeamScore,
        awayTeamScore: awayTeamScore,
        winner: homeTeamScore > awayTeamScore ? Team.homeTeam : Team.awayTeam);
  }
}
