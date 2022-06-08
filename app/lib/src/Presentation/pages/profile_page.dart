// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/src/Presentation/providers/match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/big_avatar.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/player_profile_list_item.dart';
import 'package:get_pong/src/domain/entities/game.dart';
import 'package:get_pong/src/domain/entities/player.dart';

import '../widgets/widgets.dart';

class ProfilePage extends ConsumerWidget {
  final Player player;

  const ProfilePage({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Game> matches =
        ref.watch(singleMatchProvider.notifier).getMatchesByPlayerId(player.id);

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
              imageUrl: player.imageUrl,
            ),
            SizedBox(height: 20),
            NameCard(
              playerName: player.nickname,
            ),
            SizedBox(height: 12),
            Text(
              'Rank: 1',
              style: TextStyle(
                color: ColorConstants.secondaryTextColor,
              ),
            ),
            SizedBox(height: 30),
            GameStats(
              wins: player.wins.toString(),
              losses: player.losses.toString(),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Latest games',
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                ),
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
