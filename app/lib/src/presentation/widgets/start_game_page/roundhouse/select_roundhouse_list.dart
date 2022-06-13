import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/roundhouse/select_roundhouse_list_player.dart';

class SelectRoundhouseList extends ConsumerStatefulWidget {
  const SelectRoundhouseList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SelectRoundhouseListState();
}

class _SelectRoundhouseListState extends ConsumerState<SelectRoundhouseList> {
  @override
  Widget build(BuildContext context) {
    final players = ref.watch(playersProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                route.profilePage,
                arguments: players[index],
              ),
              child: SelectRoundhouseListPlayer(
                player: players[index],
              ),
            );
          },
          itemCount: players.length,
        ),
      ),
    );
    ;
  }
}
