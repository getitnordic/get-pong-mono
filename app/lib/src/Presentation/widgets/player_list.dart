// ignore_for_file: prefer_const_constructors
import 'package:get_pong/src/Presentation/widgets/widgets.dart';

import '../../../config/route/route.dart' as route;

import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
// const PlayerList({Key? key, required this.title, required this.onTap})

  final String ranking;
  final String title;

  const PlayerList({Key? key, required this.title, required this.ranking})
      : super(key: key);
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //checkbox in här

      onTap: () => Navigator.pushNamed(context, route.profilePage),
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage('assets/images/monkey.jpg'),
      ),

      title: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 75.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                ranking,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
