// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BigAvatar extends StatelessWidget {
  const BigAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/monkey.jpg'),
              radius: 100,
            ),
          ]),
    );
  }
}
