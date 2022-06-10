import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/domain/models/player.dart';

class SelectedDoubleAvatar extends StatelessWidget {
  final Player player;

  const SelectedDoubleAvatar({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSmallContainer(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: CircleAvatar(
              radius: 12.0,
              backgroundImage: NetworkImage(player.imageUrl),
            ),
          ),
          Text(
            player.nickname,
            style: const TextStyle(
              fontSize: 12,
              color: ColorConstants.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
