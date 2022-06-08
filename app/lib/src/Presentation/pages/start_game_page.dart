import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/create_game_menu.dart';

class StartGamePage extends StatelessWidget {
  final Object? arguments;
  const StartGamePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateGameMenu();
  }
}
