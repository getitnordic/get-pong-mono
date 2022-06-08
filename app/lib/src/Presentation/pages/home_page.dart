import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/pages/pages.dart';
import 'package:get_pong/src/Presentation/widgets/rankings/player_ranking.dart';

import '../../domain/entities/player.dart';
import '../providers/bottom_bar_index_provider.dart';
import '../providers/players_notifier.dart';
import '../widgets/add_player_bottom_sheet.dart';
import '../widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  // final content = [
  //   StartGamePage(),
  //   ScoreBoardPage(),
  //   PlayerList(),
  // ];

  Widget renderContent({
    required List<Player> players,
    required int currentIndex,
  }) {
    switch (currentIndex) {
      case 1:
        return Scoreboard();
      case 2:
        return PlayerRanking();
      case 0:
      default:
        return StartGamePage();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomBarIndexProvider.state);
    List<Player> playerList = ref.watch(playersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetPong'),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddPlayerBottomSheet();
                },
              );
            },
            icon: Icon(Icons.person_add),
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
        ],
      ),
      body: Container(
        // height: 500,
        child: renderContent(
            players: playerList, currentIndex: currentIndex.state),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.state,
          showUnselectedLabels: false,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_tennis),
                label: 'Spela',
                backgroundColor: Colors.white),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                // ignore: prefer_const_constructors
                icon: Icon(Icons.scoreboard),
                label: 'ScoreBoard',
                backgroundColor: Colors.blue),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Spelare',
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            ref
                .read(bottomBarIndexProvider.notifier)
                .update((state) => state = index);
          }),
    );
  }
}

// ignore_for_file: prefer_const_constructors

// class MyBottomBar extends StatefulWidget {
//   const MyBottomBar({Key? key}) : super(key: key);

//   @override
//   _MyBottomBarState createState() => _MyBottomBarState();
// }

// class _MyBottomBarState extends State<HomePage> {
//   int _currentIndex = 0;

//   final pages = [
//     PlayerListPage(),
//     ResultPage(),
//   ];
