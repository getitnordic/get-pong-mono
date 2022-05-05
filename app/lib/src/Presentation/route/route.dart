import 'package:flutter/material.dart';
import '../pages/pages.dart';

const String homePage = 'homePage';
const String startGamePage = 'startgamepage';
const String playerListPage = 'player List Page';
const String resultPage = 'result page';
const String addPlayer = 'add player';

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
      return MaterialPageRoute(builder: (context) => ResultPage());
    case addPlayer:
      return MaterialPageRoute(builder: (context) => AddPlayer());
    default:
      throw ("This route name don't exist");
  }
}
