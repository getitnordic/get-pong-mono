import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../enums/score_type.dart';
import '../../../../enums/team.dart';
import '../../../../protos/base.pb.dart';
import '../../../../protos/game.pb.dart';
import '../../../../protos/google/protobuf/timestamp.pb.dart';
import '../../../Presentation/providers/games/games_providers.dart';
import '../../../Presentation/providers/selected_players/selected_players_providers.dart';
import '../../../core/models/score_page_set.dart';

class ScoreNotifier extends StateNotifier<List<ScorePageSet>> {
  final Reader read;
  ScoreNotifier(this.read)
      : super([
          ScorePageSet(
            homeScore: 0,
            awayScore: 0,
            setId: 0,
          )
        ]);

  void addSet(ScorePageSet set) {
    state = [...state, set];
  }

  void removeSet() {
    final newState = state;
    newState.removeLast();
    state = newState;
  }

  void _setHomeScore({required double score, required int setId}) {
    List<ScorePageSet> newState = [];
    for (var set in state) {
      if (set.setId == setId) {
        newState.add(set.copyWith(homeScore: score));
      } else {
        newState.add(set);
      }
    }
    state = newState;
  }

  void _setAwayScore({required double score, required int setId}) {
    List<ScorePageSet> newState = [];
    for (var set in state) {
      if (set.setId == setId) {
        newState.add(set.copyWith(awayScore: score));
      } else {
        newState.add(set);
      }
    }
    state = newState;
  }

  ScorePageSet getBySetId(int setId) {
    return state.firstWhere((s) => s.setId == setId);
  }

  bool checkIfScoresAreSet() {
    int homeTeamScore = 0;
    int awayTeamSCore = 0;
    for (final ScorePageSet set in state) {
      if (set.homeScore > set.awayScore) {
        homeTeamScore++;
      } else {
        awayTeamSCore++;
      }
      if (!set.isScoreSet()) {
        return false;
      }
    }
    if (homeTeamScore == awayTeamSCore) {
      return false;
    }
    return true;
  }

  void setScore({
    required int setId,
    required Team team,
    required ScoreType type,
  }) {
    final current = getBySetId(setId);

    double score =
        team == Team.homeTeam ? current.homeScore : current.awayScore;

    switch (type) {
      case ScoreType.add:
        score++;
        break;
      case ScoreType.remove:
        {
          if (score > 0) {
            score--;
          }
          break;
        }
      case ScoreType.min:
        score = 0;
        break;
      case ScoreType.max:
        score = 11;
        break;
    }

    team == Team.homeTeam
        ? _setHomeScore(score: score, setId: setId)
        : _setAwayScore(score: score, setId: setId);

    print('Triggered on notification?');
  }

  void saveNewMatch(
    PlayerModel playerOne,
    PlayerModel playerTwo,
    PlayerModel playerThree,
    PlayerModel playerFour,
  ) {
    List<SetModel> newSets = _setModelMapper();

    if (playerThree.fullName.isNotEmpty) {
      GameModel match = GameModel(
          homeTeamIds: [playerOne.id, playerTwo.id],
          awayTeamIds: [playerThree.id, playerFour.id],
          sets: newSets,
          timeStamp: Timestamp.create().createEmptyInstance());
      read(gamesProvider.notifier).createGame(match);
      read(selectedPlayersProvider.notifier).resetState();
    } else {
      GameModel match = GameModel(
          homeTeamIds: [playerOne.id],
          awayTeamIds: [playerTwo.id],
          sets: newSets,
          timeStamp: Timestamp.create().createEmptyInstance());
      read(gamesProvider.notifier).createGame(match);
      read(selectedPlayersProvider.notifier).resetState();
    }
  }

  List<SetModel> _setModelMapper() {
    List<SetModel> newSets = [];
    int counter = 1;
    for (ScorePageSet set in state) {
      newSets.add(
        SetModel(
          setNo: counter,
          homeTeam: set.homeScore.toInt(),
          awayTeam: set.awayScore.toInt(),
        ),
      );
    }
    return newSets;
  }
}
