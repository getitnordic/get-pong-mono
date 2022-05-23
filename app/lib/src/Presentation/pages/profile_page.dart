// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/ping_pong_match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/player_profile_list_item.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';
import 'package:get_pong/src/domain/entities/player.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';

import '../widgets/widgets.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    Key? key,
    required this.id,
    required this.name,
    required this.gamesWon,
    required this.gamesLost,
    required this.imageUrl,
  }) : super(key: key);

  final String id;
  final String name;
  final String gamesWon;
  final String gamesLost;
  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<PingPongMatch> matches = ref
        .watch(pingPongMatchProvider.notifier)
        .getMatchesByPlayerId(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        // ignore: prefer_const_literals_to_create_immutables

        // ignore: prefer_const_literals_to_create_immutables

        child: Column(
          children: [
            SizedBox(height: 30),
            BigAvatar(
              imageUrl: imageUrl,
            ),
            SizedBox(height: 20),
            NameCard(
              playerName: name,
            ),
            SizedBox(height: 12),
            Text(
              'Rank: 1',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            GameStats(
              wins: gamesWon,
              losses: gamesLost,
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Latest games',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    return PlayerProfileListItem(match: matches[index]);
                  }),
            ),
          ],
        ),
      ),

      // ignore: tprefer_const_literals_to_create_immutables

      // child: Column(

      //   // ignore: prefer_const_literals_to_create_immutables
      //   children: [
      //     (BigAvatar()),
      //     ConstrainedBox(
      //       constraints: BoxConstraints(
      //         maxWidth: 7,
      //         maxHeight: 7,
      //       ),
      //       child: Text(
      //         'Anders Svensson',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
