import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/streak_enum.dart';
import 'package:get_pong/src/domain/models/game.dart';

import '../../domain/models/player.dart';

class MatchNotifier extends StateNotifier<List<Game>> {
  MatchNotifier()
      : super([
          Game(teamOne: [
            const Player(
                '6',
                'Murarn',
                8,
                20,
                'https://i.pravatar.cc/100?img=44',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '4',
                'Emma',
                245,
                78,
                'https://i.pravatar.cc/100?img=32',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 11, teamTwoScore: 9),
          Game(teamOne: [
            const Player(
                '7',
                'Storkrökarn',
                32,
                32,
                'https://i.pravatar.cc/200?img=14',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '1',
                'Göran',
                10,
                24,
                'https://i.pravatar.cc/200?img=69',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 11, teamTwoScore: 9),
          Game(teamOne: [
            const Player(
                '5',
                'Gecko',
                50,
                50,
                'https://i.pravatar.cc/200?img=33',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '17',
                'Ann',
                71,
                25,
                'https://i.pravatar.cc/200?img=30',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 0, teamTwoScore: 11),
          Game(teamOne: [
            const Player(
                '16',
                'Stefan',
                8,
                5,
                'https://i.pravatar.cc/200?img=3',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '10',
                'Vattenmannen',
                20,
                100,
                'https://i.pravatar.cc/200?img=7',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 11, teamTwoScore: 7),
          Game(teamOne: [
            const Player(
                '10',
                'Vattenmannen',
                20,
                100,
                'https://i.pravatar.cc/200?img=7',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '9',
                'Lucia',
                100,
                20,
                'https://i.pravatar.cc/200?img=20',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 11, teamTwoScore: 9),
          Game(teamOne: [
            const Player(
                '12',
                'Brad Pitt',
                78,
                25,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamTwo: [
            const Player(
                '4',
                'Emma',
                245,
                78,
                'https://i.pravatar.cc/200?img=44',
                '',
                '',
                '',
                0,
                0,
                StreakEnum.none),
          ], teamOneScore: 6, teamTwoScore: 11),
          Game(teamOne: [
            Player('14', 'Adam', 87, 0, 'https://i.pravatar.cc/200?img=12', '',
                '', '', 0, 0, StreakEnum.none),
            Player('15', 'Woke', 12, 3, 'https://i.pravatar.cc/200?img=6', '',
                '', '', 0, 0, StreakEnum.none),
          ], teamTwo: [
            Player('2', 'Erik', 100, 34, 'https://i.pravatar.cc/200?img=68', '',
                '', '', 0, 0, StreakEnum.none),
            Player('3', 'Madonna', 25, 120, 'https://i.pravatar.cc/200?img=45',
                '', '', '', 0, 0, StreakEnum.none),
          ], teamOneScore: 11, teamTwoScore: 4)
        ]);

  void addMatch(Game match) {
    state = [...state, match];
  }

  List<Game> getMatchesByPlayerId(String id) {
    List<Game> matches = [];
    for (Game match in state) {
      if (match.teamOne[0].id == id) {
        matches.add(match);
      }
      if (match.teamTwo[0].id == id) {
        matches.add(match);
      }
    }
    return matches;
  }
}

final singleMatchProvider =
    StateNotifierProvider<MatchNotifier, List<Game>>((ref) => MatchNotifier());
