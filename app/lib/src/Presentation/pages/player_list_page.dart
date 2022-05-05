import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/widgets/my_add_player_form.dart';
import 'package:get_pong/src/presentation/widgets/my_player_list.dart';
import '../providers/my_providers.dart';

class PlayerListPage extends ConsumerWidget {
  final Object? arguments;

  const PlayerListPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> playerList = ref.watch(playerProvider);

    // print(playerList);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            PlayerList(players: playerList),
            AddPlayerFields(),
          ],
        ),
      ),
    );
  }
}
