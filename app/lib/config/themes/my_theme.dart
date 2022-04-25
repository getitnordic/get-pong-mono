import 'package:flutter/material.dart';

class Customtheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: Color.fromARGB(255, 48, 95, 129),
      backgroundColor: Color.fromARGB(255, 26, 52, 74),
      scaffoldBackgroundColor: Color.fromARGB(255, 26, 74, 38),
      textTheme: TextTheme(
          headline1: TextStyle(color: Colors.orange),
          headline2: TextStyle(color: Colors.green),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Color.fromARGB(255, 255, 251, 0))),
    );
  }

  static ThemeData get prodTheme {
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }
}
