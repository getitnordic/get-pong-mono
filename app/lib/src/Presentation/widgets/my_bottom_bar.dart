import 'package:flutter/material.dart';
import 'package:get_pong/enums/player_select_choice.dart';

import '../pages/pages.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;

  final pages = [
    const PlayerListPage(playerSelectIndex: PlayerSelectChoice.none),
    const ResultPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
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
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
