import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';
import 'package:get_pong/src/presentation/widgets/my_player_list.dart';
import '../route/route.dart' as route;
import '../widgets/widgets.dart';

class StartGamePage extends ConsumerWidget {
  final Object? arguments;
  const StartGamePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> playerList = ref.watch(playerProvider);
    print(playerList);

    return Column(
      children: [
        const Center(
          child: Text(
            'Create Match',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        Expanded(
          child: PlayerList(
            players: playerList,
            listTitle: 'Select player',
          ),
        ),
        ElevatedButton(onPressed: () => {}, child: Text('Start Game'))
      ],
    );
  }
}
