import 'package:flutter/material.dart';

import '../../../domain/entities/player.dart';

class SelectedPlayerAvatar extends StatelessWidget {
  const SelectedPlayerAvatar({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(player.imageUrl),
          radius: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            player.nickname,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
