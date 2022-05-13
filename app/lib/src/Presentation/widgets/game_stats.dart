// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GameStats extends StatelessWidget {
  const GameStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                      color: Color.fromARGB(255, 58, 116, 166),
                    ),
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
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
                      color: Color.fromARGB(255, 58, 116, 166),
                    ),
                  ),
                  Text(
                    '15',
                    style: TextStyle(
                      color: Colors.white,
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
                      color: Color.fromARGB(255, 58, 116, 166),
                    ),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
