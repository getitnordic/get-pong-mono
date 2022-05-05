import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import '../providers/my_providers.dart';
import '../route/route.dart' as route;

class DummyObj {
  final String id;

  DummyObj({required this.id});
}

class ResultPage extends ConsumerWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerProvider);

    return Column(
      children: [
        Text('Add your result'),
        buildPlayerResultCard('Team 1'),
        buildPlayerResultCard('Team 2'),
        Center(
          child: ElevatedButton(
            child: const Text('Go back to startGamePage'),
            onPressed: () => Navigator.pushNamed(context, route.startGamePage,
                arguments: 1337),
          ),
        ),
      ],
    );
  }

  Widget buildPlayerResultCard(String playername) => Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(playername),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Add result'),
                AddResultForm(),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      );
}
