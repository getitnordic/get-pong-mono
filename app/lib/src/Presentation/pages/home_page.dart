import 'package:flutter/material.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pages = [
    StartGamePage(),
    ResultPage(),
    PlayerListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetPong'),
        backgroundColor: Colors.red,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
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
            setState(() {
              _currentIndex = index;
            });
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

 