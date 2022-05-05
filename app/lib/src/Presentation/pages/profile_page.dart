// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
      ),
      body: Container(
        // ignore: prefer_const_literals_to_create_immutables

        child: BigAvatar(),
      ),
    );
  }
}
