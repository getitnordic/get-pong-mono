import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';

class PlayerProfileListItem extends ConsumerWidget with SetProfileImageMixin {
  const PlayerProfileListItem({Key? key, required this.match})
      : super(key: key);
  final GameModel match;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 165,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ref
                      .watch(playersProvider.notifier)
                      .getPlayerById(match.homeTeamIds[0])
                      .firstName,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorConstants.textColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundImage: NetworkImage(setImage(ref
                        .watch(playersProvider.notifier)
                        .getPlayerById(match.homeTeamIds[0])
                        .imageUrl)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    match.sets[0].homeTeam.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
            child: Text(
              ' - ',
              style: TextStyle(
                  fontSize: 12,
                  color: ColorConstants.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 165,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Text(
                    match.sets[0].awayTeam.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: ColorConstants.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundImage: NetworkImage(setImage(ref
                        .watch(playersProvider.notifier)
                        .getPlayerById(match.awayTeamIds[0])
                        .imageUrl)),
                  ),
                ),
                Text(
                  ref
                      .watch(playersProvider.notifier)
                      .getPlayerById(match.awayTeamIds[0])
                      .firstName,
                  style: const TextStyle(
                    fontSize: 11,
                    color: ColorConstants.textColor,
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
