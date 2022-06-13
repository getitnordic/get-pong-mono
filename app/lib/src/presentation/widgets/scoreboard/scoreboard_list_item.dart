import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/domain/models/game.dart';

class ScoreboardListItem extends StatelessWidget {
  final Game match;
  const ScoreboardListItem({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDouble = match.teamOne.length == 2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSmallContainer(
        width: double.infinity,
        height: isDouble ? 70 : 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 165,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
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
                                  NetworkImage(match.teamOne[0].imageUrl),
                            ),
                          ),
                        ],
                      ),
                      if (isDouble)
                        Row(
                          children: [
                            Text(
                              match.teamOne[1].nickname,
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
                                    NetworkImage(match.teamOne[1].imageUrl),
                              ),
                            ),
                          ],
                        ),
                    ],
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
                                  NetworkImage(match.teamTwo[0].imageUrl),
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
                      if (isDouble)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                radius: 12.0,
                                backgroundImage:
                                    NetworkImage(match.teamTwo[1].imageUrl),
                              ),
                            ),
                            Text(
                              match.teamTwo[1].nickname,
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
            ),
          ],
        ),
      ),
    );
  }
}
