import 'package:flutter/material.dart';

class MyPlayerAvatar extends StatelessWidget {
  const MyPlayerAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/images/monkey.jpg'),
        ),
        Text(
          'Player name',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
