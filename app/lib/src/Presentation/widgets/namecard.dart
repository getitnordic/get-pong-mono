import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  final String playerName;
  const NameCard({Key? key, required this.playerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 200,
        color: Color.fromARGB(255, 48, 95, 129),
        child: Center(
          child: Text(
            (playerName),
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
