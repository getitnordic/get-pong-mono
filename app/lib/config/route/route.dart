import 'package:flutter/material.dart';

import '../../enums/player_select_choice.dart';
import '../../protos/base.pb.dart';
import '../../src/Presentation/pages/match_details_page.dart';
import '../../src/Presentation/pages/pages.dart';
import '../../src/core/models/score_page_arguments.dart';

const String homePage = 'homePage';
const String playerListPage = 'playerListPage';
const String scorePage = 'scorepage';
const String profilePage = 'profilepage';
const String matchDetailsPage = 'matchdetails';
const String addNewPlayerPage = 'addplayer';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case playerListPage:
      {
        final playerSelectIndex = settings.arguments as PlayerSelectChoice;
        return MaterialPageRoute(
            builder: (context) => PlayerListPage(
                  playerSelectIndex: playerSelectIndex,
                ));
      }
    case scorePage:
      {
        final args = settings.arguments as ScorePageArguments;
        return MaterialPageRoute(
          builder: (context) => ScorePage(
            selectedPlayers: args.players,
            matchType: args.matchType,
          ),
        );
      }
    case profilePage:
      {
        final player = settings.arguments as PlayerModel;
        return MaterialPageRoute(
            builder: (context) => ProfilePage(
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
