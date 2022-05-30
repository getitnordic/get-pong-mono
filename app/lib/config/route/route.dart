import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/pages/match_details_page.dart';
import 'package:get_pong/src/domain/entities/player.dart';
import '../../src/Presentation/pages/pages.dart';

const String homePage = 'homePage';
const String startGamePage = 'startgamepage';
const String playerListPage = 'playerListPage';
const String scorePage = 'scorepage';
const String profilePage = 'profilepage';
const String matchDetailsPage = 'matchdetails';
const String addNewPlayerPage = 'addplayer';

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
    case scorePage: {
     final players = settings.arguments as List<String>;
     return MaterialPageRoute(builder: (context) => ScorePage(
       selectedPlayersId: players,
     ));
    }
    case profilePage: {
      final player = settings.arguments as Player;
      return MaterialPageRoute(builder: (context) => ProfilePage(
        player: player,
      ));
    }
    case matchDetailsPage:
      return MaterialPageRoute(builder: (context) => MatchDetailsPage());
    default:
      throw ("This route name don't exist");
  }
}


// case scorePage:
//       return MaterialPageRoute(
//           builder: (context) => ScorePage(arguments: settings.arguments!));