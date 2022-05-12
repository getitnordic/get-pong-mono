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
    List<String> selectedPlayers = ref.watch(selectedPlayersProvider);

    print(playerList);

    return Column(
      children: [
        Expanded(
          child: PlayerList(
            pageTitle: 'Create Match',
            players: playerList,
            selectedPlayers: selectedPlayers,
            listTitle: 'Select player',
            playerAction: (String id) {
              print('id $id');
              if (selectedPlayers.contains(id)) {
                // REMOVE
                ref.read(selectedPlayersProvider.notifier).removePlayerId(id);
                return;
              }
              // ADD
              ref.read(selectedPlayersProvider.notifier).addPlayerId(id);
            },
          ),
        ),
        ElevatedButton(onPressed: () => {}, child: Text('Start Game'))
      ],
    );
  }
}
