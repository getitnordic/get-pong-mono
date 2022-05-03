import 'package:flutter/material.dart';
import '../route/route.dart' as route;

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResultPage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go back to startGamePage'),
          onPressed: () => Navigator.pushNamed(context, route.startGamePage),
        ),
      ),
    );
  }
}
