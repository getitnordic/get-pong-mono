import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/constants.dart';
import '../../../../../enums/team.dart';
import '../../../../../protos/game.pbgrpc.dart';
import '../../../../../utils/mixins/format_date_mixin.dart';
import '../../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../../core/common/score_checker.dart';
import '../../custom_small_container.dart';
import '../../my_profile_image.dart';
import 'scoreboard_set_score.dart';

class ScoreboardCard extends ConsumerWidget
    with SetProfileImageMixin, FormatDateMixin {
  final GameModel match;
  final ScoreChecker controller;
  const ScoreboardCard({
    Key? key,
    required this.match,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = match.homeTeamIds.length == 2;

    final result = controller.getMatchScore();
    const fontSize = 12.0;
    const imageSize = 20.0;
    const setScoreWidth = 20.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = screenWidth > 800 ? screenWidth * 0.2 : 0.0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 10),
          child: CustomSmallContainer(
            height: isDouble ? 140 : 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 2),
                                    child: MyProfileImage(
                                      playerId: controller.homeTeamOne.id,
                                      size: imageSize,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      controller.homeTeamOne.fullName,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: fontSize,
                                        color: ColorConstants.textColor,
                                        fontWeight:
                                            result.winner == Team.homeTeam
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isDouble)
                              SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: MyProfileImage(
                                        playerId: controller.homeTeamTwo.id,
                                        size: imageSize,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        controller.homeTeamTwo.fullName,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: ColorConstants.textColor,
                                          fontWeight:
                                              result.winner == Team.homeTeam
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ScoreboardSetScore(
                                score: result.homeTeamScore.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                fontWeight: result.winner == Team.homeTeam
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: ColorConstants.textColor,
                              ),
                              SizedBox(
                                height: 15,
                                width: screenWidth < 400
                                    ? match.sets.length > 5
                                        ? 125
                                        : null
                                    : null,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: match.sets.length,
                                  itemBuilder: (context, index) {
                                    return ScoreboardSetScore(
                                      score:
                                          match.sets[index].homeTeam.toString(),
                                      width: setScoreWidth,
                                      fontSize: fontSize,
                                      fontWeight: result.winner == Team.homeTeam
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: ColorConstants.secondaryTextColor,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 2),
                                    child: MyProfileImage(
                                      playerId: controller.awayTeamOne.id,
                                      size: imageSize,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      controller.awayTeamOne.fullName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: ColorConstants.textColor,
                                        fontWeight:
                                            result.winner == Team.awayTeam
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isDouble)
                              SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: MyProfileImage(
                                        playerId: controller.awayTeamTwo.id,
                                        size: imageSize,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        controller.awayTeamTwo.fullName,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: ColorConstants.textColor,
                                          fontWeight:
                                              result.winner == Team.awayTeam
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ScoreboardSetScore(
                                score: result.awayTeamScore.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                fontWeight: result.winner == Team.awayTeam
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: ColorConstants.textColor,
                              ),
                              SizedBox(
                                height: 15,
                                width: screenWidth < 400
                                    ? match.sets.length > 5
                                        ? 125
                                        : null
                                    : null,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: match.sets.length,
                                  itemBuilder: (context, index) {
                                    return ScoreboardSetScore(
                                      score:
                                          match.sets[index].awayTeam.toString(),
                                      width: setScoreWidth,
                                      fontSize: fontSize,
                                      fontWeight: result.winner == Team.awayTeam
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: ColorConstants.secondaryTextColor,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
