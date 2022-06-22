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
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        player.firstName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            color: ColorConstants.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${player.win + player.loss}',
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
              Text(
                player.win.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
              Text(
                player.loss.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
              Text(
                player.totalScore.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstants.textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
