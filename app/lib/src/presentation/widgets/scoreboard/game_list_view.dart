import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/scoreboard/updated_scorecard/scoreboard_card.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/color_constants.dart';
import '../../../../protos/game.pb.dart';

class GameListView extends StatelessWidget {
  final List<GameModel> matches;

  const GameListView({
    Key? key,
    required this.matches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight) -
        kBottomNavigationBarHeight -
        (MediaQuery.of(context).size.height * 0.04);

    print(screenHeight);

    return Center(
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
                if (scrollInfo is ScrollEndNotification) {
                  if (scrollInfo.metrics.pixels > 0 &&
                      scrollInfo.metrics.atEdge) {
                    debugPrint('IM AT BOTTOM GET MORE MATCHES WITH PAGINATION');
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
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
