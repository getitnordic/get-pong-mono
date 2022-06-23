import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/scoreboard_list_item.dart';

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
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 400,
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
              child: ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        route.matchDetailsPage,
                      ),
                      child: ScoreboardListItem(
                        match: matches[index],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
