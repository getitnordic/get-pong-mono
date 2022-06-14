import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/game_list_view.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Matches',
              style: TextStyle(
                color: ColorConstants.textColor,
                fontSize: 35,
              ),
            ),
          ),
          GameListView(),
        ],
      ),
    );
  }
}
