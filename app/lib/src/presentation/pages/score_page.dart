import 'package:flutter/material.dart';

import '../../../protos/base.pb.dart';
import '../widgets/score_page/scorepage.dart';

class ScorePage extends StatelessWidget {
  final List<PlayerModel> selectedPlayers;
  const ScorePage({
    Key? key,
    required this.selectedPlayers,
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
                    )
                  : ScorePagePortrait(
                      selectedPlayers: selectedPlayers,
                    )
              : ScorePagePortrait(
                  selectedPlayers: selectedPlayers,
                ),
        );
      },
    );
  }
}
