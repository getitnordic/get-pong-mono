import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/pages/pages.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';

import '../widgets/my_player_list.dart';

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
        return ScoreBoardPage();
      case 2:
        return PlayerList(
          players: players,
          pageIndex: currentIndex,
          listTitle: 'All Players',
        );
      case 0:
      default:
        return StartGamePage();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomBarIndexProvider.state);
    List<Player> playerList = ref.watch(playerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetPong'),
        backgroundColor: Colors.red,
      ),
      body: Container(
          // height: 500,
          child: renderContent(
              players: playerList, currentIndex: currentIndex.state)),
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
                icon: Icon(Icons.menu),
                label: 'Matcher',
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

 