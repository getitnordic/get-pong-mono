import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../protos/base.pbgrpc.dart';

class PlayerRankingListPlayer extends StatelessWidget {
  const PlayerRankingListPlayer(
      {Key? key, required this.player, required this.index})
      : super(key: key);

  final PlayerModel player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
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
                          player.fullName,
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
            width: 230,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    '${player.win + player.loss}',
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    player.totalScore.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
