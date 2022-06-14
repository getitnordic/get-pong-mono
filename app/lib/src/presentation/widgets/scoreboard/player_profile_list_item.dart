import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/src/domain/models/game.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';

class PlayerProfileListItem extends StatelessWidget with SetProfileImageMixin {
  const PlayerProfileListItem({Key? key, required this.match})
      : super(key: key);
  final Game match;

  @override
  Widget build(BuildContext context) {
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
                  match.teamOne[0].nickname,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorConstants.textColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundImage:
                        NetworkImage(setImage(match.teamOne[0].imageUrl)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    match.teamOneScore.toString(),
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
                    match.teamTwoScore.toString(),
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
                    backgroundImage:
                        NetworkImage(setImage(match.teamTwo[0].imageUrl)),
                  ),
                ),
                Text(
                  match.teamTwo[0].nickname,
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
