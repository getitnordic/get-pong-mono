// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  final Object? arguments;
  const ProfilePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 30),
          BigAvatar(),
          SizedBox(height: 20),
          NameCard(
            playerName: 'jeppenator',
          ),
          SizedBox(height: 12),
          Text(
            'Rank: 1',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          GameStats(),
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
      )),

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
