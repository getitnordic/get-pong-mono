import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/providers/games/games_providers.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/color_constants.dart';
import '../../../../protos/game.pb.dart';
import '../../../../utils/extensions/compare_date.dart';
import '../../../../utils/mixins/format_date_mixin.dart';
import '../../../Presentation/widgets/scoreboard/updated_scorecard/scoreboard_controller.dart';
import '../../../core/common/blank_player_model.dart';
import '../../../core/models/match_details_arguments.dart';
import '../../providers/players/players_providers.dart';
import '../widgets.dart';
import 'updated_scorecard/scoreboard_card.dart';

class GameListView extends ConsumerStatefulWidget {
  final List<GameModel> matches;
  const GameListView({
    Key? key,
    required this.matches,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameListViewState();
}

class _GameListViewState extends ConsumerState<GameListView>
    with FormatDateMixin {
  List<GameModel> matches = [];
  bool isLoadingMore = false;
  bool allIsLoaded = false;
  int offset = 10;
  DateTime date = DateTime.fromMicrosecondsSinceEpoch(0);

  @override
  void initState() {
    super.initState();
    setState(() {
      matches = widget.matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ref.watch(fetchPlayersProvider).when(
          data: (_) {
            return Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Matches',
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Flexible(
                        child: NotificationListener(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo is ScrollStartNotification) {
                              if (scrollInfo.metrics.pixels == 0 &&
                                  scrollInfo.metrics.atEdge) {}
                            }
                            if (scrollInfo is ScrollEndNotification &&
                                !allIsLoaded) {
                              if (scrollInfo.metrics.pixels > 0 &&
                                  scrollInfo.metrics.atEdge) {
                                _loadMoreGames();
                              }
                            }
                            return false;
                          },
                          child: ListView.builder(
                            addAutomaticKeepAlives: true,
                            shrinkWrap: true,
                            itemCount: matches.length,
                            itemBuilder: (context, index) {
                              final isDouble =
                                  matches[index].homeTeamIds.length == 2;
                              final controller = ScoreboardController(
                                homeTeamOne: ref
                                    .watch(playersProvider.notifier)
                                    .getPlayerById(
                                        matches[index].homeTeamIds[0]),
                                awayTeamOne: ref
                                    .watch(playersProvider.notifier)
                                    .getPlayerById(
                                        matches[index].awayTeamIds[0]),
                                homeTeamTwo: isDouble
                                    ? ref
                                        .watch(playersProvider.notifier)
                                        .getPlayerById(
                                            matches[index].homeTeamIds[1])
                                    : BlankPlayerModel.player,
                                awayTeamTwo: isDouble
                                    ? ref
                                        .watch(playersProvider.notifier)
                                        .getPlayerById(
                                            matches[index].awayTeamIds[1])
                                    : BlankPlayerModel.player,
                                match: matches[index],
                              );

                              bool isSameDate = true;
                              final currentMatch = matches[index];
                              if (index == 0) {
                                isSameDate = false;
                              } else {
                                final previousDate =
                                    matches[index - 1].timeStamp.toDateTime();
                                final currentDate =
                                    matches[index].timeStamp.toDateTime();
                                isSameDate =
                                    currentDate.hasSameDate(previousDate);
                              }
                              if (index == 0 || !isSameDate) {
                                return _scoreboardCardWithDate(
                                    currentMatch, controller, width);
                              } else {
                                return _scoreboardCardWithoutDate(
                                    currentMatch, controller);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: ((error, stackTrace) => Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  void _loadMoreGames() async {
    setState(() {
      isLoadingMore = true;
    });

    final newMatches =
        await ref.watch(gamesProvider.notifier).getNextTenGames(offset);
    if (newMatches.isNotEmpty) {
      setState(() {
        offset += offset;
        matches.addAll(newMatches);
        isLoadingMore = false;
      });
    } else {
      setState(() {
        isLoadingMore = false;
        allIsLoaded = true;
      });
    }
  }

  Widget _scoreboardCardWithDate(
          GameModel match, ScoreboardController controller, double width) =>
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width < 500 ? 50 : 150,
                child: const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              CustomSmallContainer(
                height: 40,
                width: 200,
                child: Text(
                  formatDate(
                    match.timeStamp.toDateTime(),
                  ),
                  style: const TextStyle(
                      color: ColorConstants.textColor, fontSize: 14),
                ),
              ),
              SizedBox(
                width: width < 500 ? 50 : 150,
                child: const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              route.matchDetailsPage,
              arguments:
                  MatchDetailsArguments(game: match, controller: controller),
            ),
            child: ScoreboardCard(
              match: match,
              controller: controller,
            ),
            //ScoreboardListItem(
            //match: matches[index],
            //),
          ),
        ],
      );

  Widget _scoreboardCardWithoutDate(
          GameModel match, ScoreboardController controller) =>
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              route.matchDetailsPage,
              arguments:
                  MatchDetailsArguments(game: match, controller: controller),
            ),
            child: ScoreboardCard(
              match: match,
              controller: controller,
            ),
            //ScoreboardListItem(
            //match: matches[index],
            //),
          ),
        ],
      );
}
