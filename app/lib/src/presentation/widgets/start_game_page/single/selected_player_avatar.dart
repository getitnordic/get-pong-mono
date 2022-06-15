import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';

class SelectedPlayerAvatar extends StatelessWidget {
  const SelectedPlayerAvatar({
    Key? key,
    required this.player,
  }) : super(key: key);

  final PlayerModel player;

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
                color: ColorConstants.textColor),
          ),
        ),
      ],
    );
  }
}
