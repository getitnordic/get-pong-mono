import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/constants.dart';
import 'package:get_pong/enums/team.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/presentation/widgets/scoreboard/updated_scorecard/scoreboard_controller.dart';
import 'package:get_pong/src/presentation/widgets/scoreboard/updated_scorecard/scoreboard_set_score.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import '../../../../Presentation/providers/players_notifier.dart';
import '../../../../core/common/common.dart';

class ScoreboardCard extends ConsumerWidget with SetProfileImageMixin {
  final GameModel match;
  const ScoreboardCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = match.homeTeamIds.length == 2;
    final controller = ScoreboardController(
      homeTeamOne: ref
          .watch(playersProvider.notifier)
          .getPlayerById(match.homeTeamIds[0]),
      awayTeamOne: ref
          .watch(playersProvider.notifier)
          .getPlayerById(match.awayTeamIds[0]),
      homeTeamTwo: isDouble
          ? ref
              .watch(playersProvider.notifier)
              .getPlayerById(match.homeTeamIds[1])
          : BlankPlayerModel.player,
      awayTeamTwo: isDouble
          ? ref
              .watch(playersProvider.notifier)
              .getPlayerById(match.awayTeamIds[1])
          : BlankPlayerModel.player,
      match: match,
    );

    final result = controller.getMatchScore();
    final amountOfSets = controller.getAmountOfSets();
    const fontSize = 12.0;
    const imageSize = 10.0;
    const setScoreWidth = 20.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = screenWidth > 800 ? screenWidth * 0.2 : 0.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 10),
      child: CustomSmallContainer(
        height: isDouble ? 130 : 80,
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
                                child: CircleAvatar(
                                  radius: imageSize,
                                  backgroundImage: NetworkImage(setImage(
                                      controller.homeTeamOne.imageUrl)),
                                ),
                              ),
                              Text(
                                controller.homeTeamOne.fullName,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: ColorConstants.textColor,
                                  fontWeight: result.winner == Team.homeTeam
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
                                  child: CircleAvatar(
                                    radius: imageSize,
                                    backgroundImage: NetworkImage(setImage(
                                        controller.homeTeamTwo.imageUrl)),
                                  ),
                                ),
                                Text(
                                  controller.homeTeamTwo.fullName,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    color: ColorConstants.textColor,
                                    fontWeight: result.winner == Team.homeTeam
                                        ? FontWeight.bold
                                        : FontWeight.normal,
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
                                  score: match.sets[index].homeTeam.toString(),
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
                                child: CircleAvatar(
                                  radius: imageSize,
                                  backgroundImage: NetworkImage(setImage(
                                      controller.awayTeamOne.imageUrl)),
                                ),
                              ),
                              Text(
                                controller.awayTeamOne.fullName,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: ColorConstants.textColor,
                                  fontWeight: result.winner == Team.awayTeam
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
                                  child: CircleAvatar(
                                    radius: imageSize,
                                    backgroundImage: NetworkImage(setImage(
                                        controller.awayTeamTwo.imageUrl)),
                                  ),
                                ),
                                Text(
                                  controller.awayTeamTwo.fullName,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    color: ColorConstants.textColor,
                                    fontWeight: result.winner == Team.awayTeam
                                        ? FontWeight.bold
                                        : FontWeight.normal,
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
                                  score: match.sets[index].awayTeam.toString(),
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
    );
  }
}
