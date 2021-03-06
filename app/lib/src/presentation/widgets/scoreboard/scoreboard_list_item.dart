import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';

class ScoreboardListItem extends ConsumerWidget with SetProfileImageMixin {
  final GameModel match;
  const ScoreboardListItem({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = match.homeTeamIds.length == 2;
    final homeTeamOne =
        ref.watch(playersProvider.notifier).getPlayerById(match.homeTeamIds[0]);
    final awayTeamOne =
        ref.watch(playersProvider.notifier).getPlayerById(match.awayTeamIds[0]);
    PlayerModel homeTeamTwo = BlankPlayerModel.player;
    PlayerModel awayTeamTwo = BlankPlayerModel.player;
    if (isDouble) {
      homeTeamTwo = ref
          .watch(playersProvider.notifier)
          .getPlayerById(match.homeTeamIds[1]);
      awayTeamTwo = ref
          .watch(playersProvider.notifier)
          .getPlayerById(match.awayTeamIds[1]);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSmallContainer(
        width: double.infinity,
        height: isDouble ? 70 : 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            homeTeamOne.fullName,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorConstants.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 11.0,
                            backgroundImage:
                                NetworkImage(setImage(homeTeamOne.imageUrl)),
                          ),
                        ),
                      ],
                    ),
                    if (isDouble)
                      Row(
                        children: [
                          Text(
                            homeTeamTwo.fullName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorConstants.textColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              radius: 11.0,
                              backgroundImage:
                                  NetworkImage(setImage(homeTeamTwo.imageUrl)),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    match.sets[0].homeTeam.toString(),
                    style: const TextStyle(
                        fontSize: 11,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
              child: Text(
                ' - ',
                style: TextStyle(
                    fontSize: 11,
                    color: ColorConstants.textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Text(
                    match.sets[0].awayTeam.toString(),
                    style: const TextStyle(
                        fontSize: 11,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 12.0,
                            backgroundImage:
                                NetworkImage(setImage(awayTeamOne.imageUrl)),
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Text(
                            awayTeamOne.fullName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorConstants.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isDouble)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 12.0,
                              backgroundImage:
                                  NetworkImage(setImage(awayTeamTwo.imageUrl)),
                            ),
                          ),
                          Text(
                            awayTeamTwo.fullName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorConstants.textColor,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
