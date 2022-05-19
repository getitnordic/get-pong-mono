import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';

import '../../domain/entities/scoreboard_player.dart';

class PingPongMatchNotifier extends StateNotifier<List<PingPongMatch>> {
  PingPongMatchNotifier() : super([
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Murarn', 8, 20, 'https://i.pravatar.cc/100?img=44'),
        playerTwo: const ScoreboardPlayer('Emma', 245, 78, 'https://i.pravatar.cc/100?img=32'),
        playerOneScore: 25,
        playerTwoScore: 11
    ),
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Storkrökarn', 32, 32, 'https://i.pravatar.cc/100?img=14'),
        playerTwo: const ScoreboardPlayer('Göran', 10, 24, 'https://i.pravatar.cc/100?img=69'),
        playerOneScore: 25,
        playerTwoScore: 23
    ),
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Gecko', 50, 50, 'https://i.pravatar.cc/100?img=33'),
        playerTwo: const ScoreboardPlayer('Ann', 71, 25, 'https://i.pravatar.cc/100?img=30'),
        playerOneScore: 0,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Stefan', 8, 5, 'https://i.pravatar.cc/100?img=3'),
        playerTwo: const ScoreboardPlayer('Kocken', 65, 45, 'https://i.pravatar.cc/100?img=11'),
        playerOneScore: 25,
        playerTwoScore: 18
    ),
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Vattenmannen', 20, 100, 'https://i.pravatar.cc/100?img=7'),
        playerTwo: const ScoreboardPlayer('Lucia', 100, 20, 'https://i.pravatar.cc/100?img=20'),
        playerOneScore: 23,
        playerTwoScore: 25
    ),
    PingPongMatch(
        playerOne: const ScoreboardPlayer('Brad Pitt', 78, 25, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.PLaeTcrtaHMZxHQCRR3gxwHaHa%26pid%3DApi&f=1'),
        playerTwo: const ScoreboardPlayer('Stefan', 8, 5, 'https://i.pravatar.cc/100?img=3'),
        playerOneScore: 16,
        playerTwoScore: 25
    ),
  ]);
}

final pingPongMatchProvider = StateNotifierProvider<PingPongMatchNotifier,
    List<PingPongMatch>>((ref) => PingPongMatchNotifier());