// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/examplelist.dart';
import '../../presentation/providers/my_providers.dart';
import '../widgets/widgets.dart';

class PlayerListPage extends ConsumerWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String test = ref.watch(testProvider);
    List<Player> players = ref.watch(playerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player List'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
            // SizedBox(height: 20),
            // BigButton(title: 'Player List'),
            // SizedBox(height: 50),
            // SmallButton(),
            // SizedBox(height: 20),
            // ColumnTitle(),
            Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: PlayerListColumn(),
                        // PlayerListColumn(),
                      ),
                    ],
                  )
                ]),
          ])),
    );
  }
}
