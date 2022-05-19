// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BigAvatar extends StatelessWidget {
  const BigAvatar({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 80,
      ),
    );
  }
}
