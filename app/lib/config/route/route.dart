import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/Presentation/pages/pages.dart';

const String homePage = 'homePage';
const String startGamePage = 'startgamepage';
const String playerListPage = 'playerListPage';
const String scorePage = 'scorepage';
const String profilePage = 'profilepage';

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
    case scorePage:
      return MaterialPageRoute(builder: (context) => ScorePage());
    case profilePage:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      throw ("This route name don't exist");
  }
}


// case scorePage:
//       return MaterialPageRoute(
//           builder: (context) => ScorePage(arguments: settings.arguments!));