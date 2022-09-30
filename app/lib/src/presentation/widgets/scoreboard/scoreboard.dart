import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Presentation/widgets/scoreboard/game_list_view.dart';
import '../../providers/games_providers.dart';


class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchTenGamesProvider).when(
          data: (data) {
            return GameListView(matches: data);
          },
          error: ((error, stackTrace) => Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
