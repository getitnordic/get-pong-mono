// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';

class GameStats extends StatelessWidget {
  const GameStats({Key? key, required this.wins, required this.losses})
      : super(key: key);
  final String wins;
  final String losses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
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
                  '15',
                  style: TextStyle(
                    color: ColorConstants.textColor,
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
