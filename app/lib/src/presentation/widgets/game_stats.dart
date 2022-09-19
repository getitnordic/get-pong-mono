// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/protos.dart';

class GameStats extends StatelessWidget {
  final String wins;
  final String losses;
  final String streak;
  final StreakEnum streakEnum;
  const GameStats(
      {Key? key,
      required this.wins,
      required this.losses,
      required this.streak,
      required this.streakEnum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 20),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 32, 184, 95),
                  ),
                ),
                Text(
                  'Games Won',
                  style: TextStyle(
                    color: ColorConstants.secondaryTextColor,
                  ),
                ),
                Text(
                  wins,
                  style: TextStyle(
                    color: ColorConstants.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            SizedBox(height: 20),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 248, 114, 39),
                  ),
                ),
                Text(
                  'Streak',
                  style: TextStyle(
                    color: ColorConstants.secondaryTextColor,
                  ),
                ),
                Text(
                  streak,
                  style: TextStyle(
                    color: streakEnum == StreakEnum.WIN
                        ? Color.fromARGB(255, 32, 184, 95)
                        : Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 20),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                Text(
                  'GamesLost',
                  style: TextStyle(
                    color: ColorConstants.secondaryTextColor,
                  ),
                ),
                Text(
                  losses,
                  style: TextStyle(
                    color: ColorConstants.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
