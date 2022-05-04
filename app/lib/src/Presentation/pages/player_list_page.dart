import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/main_dev.dart';
import 'package:get_pong/src/presentation/widgets/my_player_avatar.dart';
import '../route/route.dart' as route;

class PlayerListPage extends ConsumerWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String test = ref.watch(testProvider);
    List<Player> players = ref.watch(playerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Player list',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 250,
              child: ListView(shrinkWrap: true, children: [
                for (final player in players)
                  MyPlayerAvatar(
                      title: player.name, onTap: () => print(player.email)),
              ]),
            ),
            ElevatedButton(
              child: const Text('Click to add Result'),
              onPressed: () => Navigator.pushNamed(context, route.resultPage),
            ),
            ElevatedButton(
              child: const Text('Click to add player'),
              onPressed: () => Navigator.pushNamed(context, route.addPlayer),
            ),
          ],
        ),
      ),
    );
  }
}
