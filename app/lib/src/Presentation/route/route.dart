import 'package:flutter/material.dart';
import '../pages/pages.dart';

const String homePage = 'homePage';
const String startGamePage = 'startgamepage';
const String playerListPage = 'playerListPage';
const String resultPage = 'result page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case startGamePage:
      return MaterialPageRoute(
          builder: (context) => StartGamePage(
                arguments: settings.arguments!,
              ));
    case playerListPage:
      return MaterialPageRoute(builder: (context) => PlayerListPage());
    case resultPage:
      return MaterialPageRoute(
          builder: (context) => ResultPage(arguments: settings.arguments!));

    default:
      throw ("This route name don't exist");
  }
}
