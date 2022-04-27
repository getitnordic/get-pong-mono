import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: Color.fromARGB(255, 48, 95, 129),
      backgroundColor: Color.fromARGB(255, 55, 0, 255),
      bottomAppBarColor: Color.fromARGB(255, 26, 74, 38),
      scaffoldBackgroundColor: Colors.white70,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
        backgroundColor: Color.fromARGB(255, 23, 44, 63),
      ),
      textTheme: Typography.material2018().white.copyWith(
            bodyText1: GoogleFonts.goldman(),
            bodyText2: GoogleFonts.goldman(),
          ),
      //   textTheme: TextTheme(
      //       headline1: TextStyle(color: Colors.orange),
      //       headline2: TextStyle(color: Color.fromARGB(255, 10, 34, 11)),
      //       bodyText1: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
      //       bodyText2: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
    );
  }

  static ThemeData get prodTheme {
    return ThemeData(
      dividerColor: Color.fromARGB(255, 48, 95, 129),
      primaryColor: Colors.black,
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Color.fromARGB(255, 26, 52, 74),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 248, 114, 39),
        unselectedItemColor: Color.fromARGB(255, 130, 164, 193),
        selectedLabelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
        backgroundColor: Color.fromARGB(255, 23, 44, 63),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 23, 44, 63),
        titleTextStyle: GoogleFonts.gochiHand(
            color: Color.fromARGB(255, 130, 164, 193), fontSize: 20),
      ),
      textTheme: Typography.material2018().white.copyWith(
            bodyText1: GoogleFonts.goldman(),
            bodyText2: GoogleFonts.goldman(fontSize: 40, color: Colors.white),
          ),
    );
  }
}
