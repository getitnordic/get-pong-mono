import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_app.dart';

void main() {
  runApp(MyApp(
    themeDataLight: ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.red,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
      ),
      textTheme: Typography.material2018().white.copyWith(
            bodyText1: GoogleFonts.goldman(),
            bodyText2: GoogleFonts.goldman(),
          ),
    ),
    themeDataDark: ThemeData.dark(),
  ));
}
