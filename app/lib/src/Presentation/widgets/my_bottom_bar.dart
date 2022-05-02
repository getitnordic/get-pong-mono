import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis), label: 'Spela'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Matcher'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Spelare'),
      ],
    );
  }
}
