import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      BottomNavigationBarItem(icon: Icon(Icons.group), label: 'players'),
      BottomNavigationBarItem(icon: Icon(Icons.sports_tennis), label: 'play')
    ]);
  }
}
