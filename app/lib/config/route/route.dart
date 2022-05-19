import 'package:flutter/material.dart';
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
    case profilePage: {
      final args = settings.arguments as Map;
      return MaterialPageRoute(builder: (context) => ProfilePage(
        name: args['name'],
        gamesWon: args['gamesWon'],
        gamesLost: args['gamesLost'],
        imageUrl: args['imageUrl'],
      ));
    }
    default:
      throw ("This route name don't exist");
  }
}


// case scorePage:
//       return MaterialPageRoute(
//           builder: (context) => ScorePage(arguments: settings.arguments!));