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
        body: Container(
          // ignore: prefer_const_literals_to_create_immutables

          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              (BigAvatar()),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 7,
                  maxHeight: 7,
                ),
                child: Text(
                  'Anders Svensson',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
