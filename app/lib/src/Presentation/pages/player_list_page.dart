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
        child: ElevatedButton(
          child: const Text('Click to add Result'),
          onPressed: () => Navigator.pushNamed(context, route.resultPage),
        ),
      ),
    );
  }
}
