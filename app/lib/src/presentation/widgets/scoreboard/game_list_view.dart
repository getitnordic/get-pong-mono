import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/color_constants.dart';
import '../../../../protos/game.pb.dart';
import '../../../../utils/extensions/compare_date.dart';
import '../../../../utils/mixins/format_date_mixin.dart';
import '../../providers/matches_notifier.dart';
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
                    if (scrollInfo is ScrollEndNotification && !allIsLoaded) {
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
                      bool isSameDate = true;
                      final currentMatch = matches[index];
                      final currentDate = matches[index].timeStamp.toDateTime();

                      if (index == 0) {
                        isSameDate = false;
                      } else {
                        final previousDate =
                            matches[index - 1].timeStamp.toDateTime();
                        isSameDate = currentDate.hasSameDate(previousDate);
                      }
                      if (index == 0 || !isSameDate) {
                        return _scoreboardCardWithDate(currentMatch);
                      } else {
                        return _scoreboardCardWithoutDate(currentMatch);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isLoadingMore)
          const Opacity(
            opacity: 0.2,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoadingMore)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  void _loadMoreGames() async {
    setState(() {
      isLoadingMore = true;
    });

    final newMatches =
        await ref.watch(matchesProvider.notifier).getNextTenMatches(offset);
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

  Widget _scoreboardCardWithDate(GameModel match) => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 150,
                child: Divider(
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
                    color: ColorConstants.textColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 150,
                child: Divider(
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
            ),
            child: ScoreboardCard(match: match),
            //ScoreboardListItem(
            //match: matches[index],
            //),
          ),
        ],
      );

  Widget _scoreboardCardWithoutDate(GameModel match) => Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              route.matchDetailsPage,
            ),
            child: ScoreboardCard(match: match),
            //ScoreboardListItem(
            //match: matches[index],
            //),
          ),
        ],
      );
}
