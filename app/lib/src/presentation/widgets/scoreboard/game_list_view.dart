import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/scoreboard_list_item.dart';

import '../../../../config/route/route.dart' as route;

class GameListView extends ConsumerWidget {
  const GameListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchProvider);

    return Flexible(
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
    );
  }
}
