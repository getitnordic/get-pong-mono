import 'package:flutter/material.dart';
import 'package:get_pong/enums/match_type.dart';

import '../../../protos/base.pb.dart';
import '../widgets/score_page/scorepage.dart';

class ScorePage extends StatelessWidget {
  final List<PlayerModel> selectedPlayers;
  final MatchType matchType;
  const ScorePage({
    Key? key,
    required this.selectedPlayers,
    required this.matchType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Center(
          child: orientation == Orientation.landscape
              ? MediaQuery.of(context).size.height > 500
                  ? ScorePageLandscape(
                      selectedPlayers: selectedPlayers,
                      matchType: matchType,
                    )
                  : ScorePagePortrait(
                      selectedPlayers: selectedPlayers,
                      matchType: matchType,
                    )
              : ScorePagePortrait(
                  selectedPlayers: selectedPlayers,
                  matchType: matchType,
                ),
        );
      },
    );
  }
}
