// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BigAvatar extends StatelessWidget {
  const BigAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/monkey.jpg'),
          radius: 80,
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutable
    );
  }
}
