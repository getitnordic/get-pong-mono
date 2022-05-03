import 'package:flutter/material.dart';
import '../route/route.dart' as route;

class PlayerListPage extends StatelessWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player List page'),
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
