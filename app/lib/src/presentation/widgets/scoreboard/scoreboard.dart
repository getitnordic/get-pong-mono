import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/game_list_view.dart';
import '../../providers/providers.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(matchesLoadingProvider)
        ? const Center(child: CircularProgressIndicator())
        : GameListView(matches: ref.watch(matchProvider));
  }
}
