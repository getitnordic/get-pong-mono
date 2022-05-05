import 'package:flutter/material.dart';
import '../../src/presentation/pages/pages.dart';

const String homePage = 'homePage';
const String startGamePage = 'startgamepage';
const String playerListPage = 'player List Page';
const String resultPage = 'result page';
const String addPlayer = 'add player';
const String profilePage = 'profile page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case startGamePage:
      return MaterialPageRoute(builder: (context) => StartGamePage());
    case playerListPage:
      return MaterialPageRoute(builder: (context) => PlayerListPage());
    case resultPage:
      return MaterialPageRoute(builder: (context) => ResultPage());
    case addPlayer:
      return MaterialPageRoute(builder: (context) => AddPlayer());
    case profilePage:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      throw ("This route name don't exist");
  }
}
