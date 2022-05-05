// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../config/route/route.dart' as route;

class PlayerListAvatar extends StatelessWidget {
  const PlayerListAvatar(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.ranking})
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  final String ranking;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            //  SmallCheckBox(),
          ],
        ),
      ),
    );
  }
}
