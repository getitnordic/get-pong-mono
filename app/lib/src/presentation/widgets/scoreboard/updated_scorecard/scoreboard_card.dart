import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/constants.dart';
import 'package:get_pong/enums/team.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/models/match_result.dart';
import 'package:get_pong/src/presentation/widgets/scoreboard/updated_scorecard/scoreboard_set_score.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import '../../../../../protos/base.pb.dart';
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

    MatchResult checkSetWinner() {
      int homeTeamScore = 0;
      int awayTeamScore = 0;

      for (final set in match.sets) {
        if (set.homeTeam > set.awayTeam) {
          homeTeamScore++;
        } else {
          awayTeamScore++;
        }
      }
      Team winner =
          homeTeamScore > awayTeamScore ? Team.homeTeam : Team.awayTeam;

      return MatchResult(
          homeTeamScore: homeTeamScore,
          awayTeamScore: awayTeamScore,
          winner: winner);
    }

    int getAmountOfSets() {
      print(match.sets.length);
      if (match.sets.length == 3) {
        return 3;
      }
      if (match.sets.length == 5) {
        print('This has 5 sets!');
        print(match.sets[3].awayTeam);
        return 5;
      }
      return 1;
    }

    final result = checkSetWinner();
    final amountOfSets = getAmountOfSets();
    const fontSize = 12.0;
    const setScoreWidth = 20.0;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: ColorConstants.appBarColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.secondaryTextColor),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            height: 55,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: fontSize,
                              backgroundImage:
                                  NetworkImage(setImage(homeTeamOne.imageUrl)),
                            ),
                          ),
                          Text(
                            homeTeamOne.firstName,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ScoreboardSetScore(
                              score: result.homeTeamScore.toString(),
                              width: setScoreWidth,
                              fontSize: fontSize,
                              winner: result.winner,
                              color: ColorConstants.textColor,
                            ),
                            ScoreboardSetScore(
                              score: match.sets[0].homeTeam.toString(),
                              width: setScoreWidth,
                              fontSize: fontSize,
                              winner: result.winner,
                              color: ColorConstants.secondaryTextColor,
                            ),
                            if (amountOfSets == 3) ...[
                              ScoreboardSetScore(
                                score: match.sets[1].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[2].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                            ],
                            if (amountOfSets == 5) ...[
                              ScoreboardSetScore(
                                score: match.sets[1].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[2].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[3].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[4].homeTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: fontSize,
                              backgroundImage:
                                  NetworkImage(setImage(awayTeamOne.imageUrl)),
                            ),
                          ),
                          Text(
                            awayTeamOne.firstName,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ScoreboardSetScore(
                              score: result.awayTeamScore.toString(),
                              width: setScoreWidth,
                              fontSize: fontSize,
                              winner: result.winner,
                              color: ColorConstants.textColor,
                            ),
                            ScoreboardSetScore(
                              score: match.sets[0].awayTeam.toString(),
                              width: setScoreWidth,
                              fontSize: fontSize,
                              winner: result.winner,
                              color: ColorConstants.secondaryTextColor,
                            ),
                            if (amountOfSets == 3) ...[
                              ScoreboardSetScore(
                                score: match.sets[1].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[2].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                            ],
                            if (amountOfSets == 5) ...[
                              ScoreboardSetScore(
                                score: match.sets[1].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[2].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[3].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                              ScoreboardSetScore(
                                score: match.sets[4].awayTeam.toString(),
                                width: setScoreWidth,
                                fontSize: fontSize,
                                winner: result.winner,
                                color: ColorConstants.secondaryTextColor,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
