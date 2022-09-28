import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/color_constants.dart';
import '../../../../protos/game.pbgrpc.dart';
import '../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../core/common/blank_player_model.dart';
import '../../providers/players_providers.dart';
import '../../controllers/scoreboard_controller.dart';

class PlayerProfileListItem extends ConsumerWidget with SetProfileImageMixin {
  const PlayerProfileListItem({Key? key, required this.match})
      : super(key: key);
  final GameModel match;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = match.homeTeamIds.length == 2;
    final playersController = ref.watch(playersProvider.notifier);
    final controller = ScoreboardController(
      homeTeamOne: playersController.getPlayerById(match.homeTeamIds[0]),
      awayTeamOne: playersController.getPlayerById(match.awayTeamIds[0]),
      homeTeamTwo: isDouble
          ? playersController.getPlayerById(match.homeTeamIds[1])
          : BlankPlayerModel.player,
      awayTeamTwo: isDouble
          ? playersController.getPlayerById(match.awayTeamIds[1])
          : BlankPlayerModel.player,
      match: match,
    );

    double width(BuildContext context) => MediaQuery.of(context).size.width;
    double rowWidth = width(context) * 0.40;

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                width: rowWidth,
                child: Text(
                  controller.homeTeamOne.fullName,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorConstants.textColor,
                  ),
                ),
              ),
              if (isDouble)
                SizedBox(
                  width: rowWidth,
                  child: Text(
                    controller.homeTeamTwo.fullName,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.getMatchScore().homeTeamScore.toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.textColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 15,
                  child: Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  controller.getMatchScore().awayTeamScore.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.textColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: rowWidth,
                child: Text(
                  controller.awayTeamOne.fullName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorConstants.textColor,
                  ),
                ),
              ),
              if (isDouble)
                SizedBox(
                  width: rowWidth,
                  child: Text(
                    controller.awayTeamTwo.fullName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
