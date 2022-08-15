import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/color_constants.dart';
import '../../../../protos/game.pb.dart';
import '../../providers/matches_notifier.dart';
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

class _GameListViewState extends ConsumerState<GameListView> {
  List<GameModel> matches = [];
  bool isLoadingMore = false;
  bool allIsLoaded = false;
  int offset = 10;

  @override
  void initState() {
    super.initState();
    setState(() {
      matches = widget.matches;
    });
  }

  void loadMoreGames() async {
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
                        loadMoreGames();
                      }
                    }
                    return false;
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: matches.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          route.matchDetailsPage,
                        ),
                        child: ScoreboardCard(match: matches[index]),
                        //ScoreboardListItem(
                        //match: matches[index],
                        //),
                      );
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
}
