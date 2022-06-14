import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';

import '../../../../protos/base.pbgrpc.dart';

class PlayerRankingListPlayer extends StatelessWidget {
  const PlayerRankingListPlayer(
      {Key? key, required this.player, required this.index})
      : super(key: key);

  final PlayerModel player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Row(
              children: [
                Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    player.nickname,
                    style: const TextStyle(
                        fontSize: 15,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50,
              child: Text(
                '${player.win + player.loss}',
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                player.win.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                player.loss.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
