// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_pong/src/domain/entities/player.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.name,
    required this.gamesWon,
    required this.gamesLost,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String gamesWon;
  final String gamesLost;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {

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
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 40),
                Text(
                  'Match Result',
                  style: TextStyle(
                    color: Color.fromARGB(255, 58, 116, 166),
                  ),
                ),
                SizedBox(width: 70),
                Text(
                  'Points',
                  style: TextStyle(
                    color: Color.fromARGB(255, 58, 116, 166),
                  ),
                ),
              ],
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
