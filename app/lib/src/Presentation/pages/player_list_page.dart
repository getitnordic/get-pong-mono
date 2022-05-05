import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/main_dev.dart';
import 'package:get_pong/src/presentation/widgets/my_player_avatar.dart';
import '../providers/my_providers.dart';
import '../route/route.dart' as route;

class PlayerListPage extends ConsumerWidget {
  final Object? arguments;
  const PlayerListPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerProvider);
    return Center(
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
        ],
      ),
    );
  }
}
