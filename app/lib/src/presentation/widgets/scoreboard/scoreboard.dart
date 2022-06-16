import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/game_list_view.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: FutureBuilder(
          future: ref.watch(matchProvider.notifier).fetchGames(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GameListView(matches: ref.watch(matchProvider));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
