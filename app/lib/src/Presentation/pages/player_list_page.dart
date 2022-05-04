import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/main_dev.dart';
import '../route/route.dart' as route;

class PlayerListPage extends ConsumerWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String test = ref.watch(testProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'test',
        ),
      ),
      body: Center(
        child: ListView(children: [
          ElevatedButton(
            child: const Text('Click to add Result'),
            onPressed: () => Navigator.pushNamed(context, route.resultPage),
          ),
          ElevatedButton(
            child: const Text('Click to add player'),
            onPressed: () => Navigator.pushNamed(context, route.addPlayer),
          ),
        ]),
      ),
    );
  }
}
