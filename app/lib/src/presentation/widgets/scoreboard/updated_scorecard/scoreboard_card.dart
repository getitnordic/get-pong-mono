import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/constants.dart';
import 'package:get_pong/enums/team.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/src/core/models/match_result.dart';
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

    final result = checkSetWinner();
    const fontSize = 12.0;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: ColorConstants.appBarColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.secondaryTextColor),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            height: 70,
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
                      SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              result.homeTeamScore.toString(),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: ColorConstants.textColor,
                                fontWeight: result.winner == Team.homeTeam
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Text(
                              match.sets[0].homeTeam.toString(),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: ColorConstants.secondaryTextColor,
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
                      SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              result.awayTeamScore.toString(),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: ColorConstants.textColor,
                                fontWeight: result.winner == Team.awayTeam
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Text(
                              match.sets[0].awayTeam.toString(),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: ColorConstants.secondaryTextColor,
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
                ]),
          ),
        ),
      ),
    );
  }
}
