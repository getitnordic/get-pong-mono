import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';

import '../../domain/entities/player.dart';

class PingPongMatchNotifier extends StateNotifier<List<PingPongMatch>> {
  PingPongMatchNotifier() : super([
    PingPongMatch(
        playerOne: Player('6', 'Murarn', 8, 20, 'https://i.pravatar.cc/100?img=44'),
        playerTwo: Player('4', 'Emma', 245, 78, 'https://i.pravatar.cc/100?img=32'),
        playerOneScore: 25,
        playerTwoScore: 11
    ),
    PingPongMatch(
        playerOne: Player('7', 'Storkrökarn', 32, 32, 'https://i.pravatar.cc/200?img=14'),
        playerTwo: Player('1', 'Göran', 10, 24, 'https://i.pravatar.cc/200?img=69'),
        playerOneScore: 25,
        playerTwoScore: 23
    ),
    PingPongMatch(
        playerOne: Player('5', 'Gecko', 50, 50, 'https://i.pravatar.cc/200?img=33'),
        playerTwo: Player('17', 'Ann', 71, 25, 'https://i.pravatar.cc/200?img=30'),
        playerOneScore: 0,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: Player('16', 'Stefan', 8, 5, 'https://i.pravatar.cc/200?img=3'),
        playerTwo: Player('13', 'Kocken', 65, 45, 'https://i.pravatar.cc/200?img=11'),
        playerOneScore: 25,
        playerTwoScore: 18
    ),
    PingPongMatch(
        playerOne: Player('10', 'Vattenmannen', 20, 100, 'https://i.pravatar.cc/200?img=7'),
        playerTwo: Player('9', 'Lucia', 100, 20, 'https://i.pravatar.cc/200?img=20'),
        playerOneScore: 23,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: Player('16', 'Stefan', 8, 5, 'https://i.pravatar.cc/200?img=3'),
        playerOneScore: 16,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: Player('8', 'Benny', 12, 75, 'https://i.pravatar.cc/200?img=8'),
        playerOneScore: 25,
        playerTwoScore: 10
    ),
    PingPongMatch(
        playerOne: Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: Player('4', 'Emma', 245, 78, 'https://i.pravatar.cc/200?img=44'),
        playerOneScore: 25,
        playerTwoScore: 23
    ),
    PingPongMatch(
        playerOne: Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: Player('7', 'Storkrökarn', 32, 32, 'https://i.pravatar.cc/200?img=14'),
        playerOneScore: 17,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: Player('12', 'Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: Player('13', 'Kocken', 65, 45, 'https://i.pravatar.cc/200?img=11'),
        playerOneScore: 25,
        playerTwoScore: 19
    ),
  ]);

  void addMatch(PingPongMatch match) {
    state = [...state, match];
  }

  List<PingPongMatch> getMatchesByPlayerId(String id) {
    List<PingPongMatch> matches = [];
    for (PingPongMatch match in state) {
      if(match.playerOne.id == id) {
        matches.add(match);
      }
      if(match.playerTwo.id == id) {
        matches.add(match);
      }
    }
    return matches;
  }

}

final pingPongMatchProvider = StateNotifierProvider<PingPongMatchNotifier,
    List<PingPongMatch>>((ref) => PingPongMatchNotifier());