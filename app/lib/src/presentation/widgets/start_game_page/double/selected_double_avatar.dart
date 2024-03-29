import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../protos/base.pb.dart';
import '../../../../Presentation/widgets/custom_small_container.dart';

class SelectedDoubleAvatar extends StatelessWidget {
  final PlayerModel player;

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
