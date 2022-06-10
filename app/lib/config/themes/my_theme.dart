import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: ColorConstants.primaryColor,
      backgroundColor: Color.fromARGB(255, 55, 0, 255),
      bottomAppBarColor: ColorConstants.appBarColor,
      scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
      dividerColor: ColorConstants.dividerColor,
      // scaffoldBackgroundColor: Color.fromARGB(255, 26, 52, 74),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.appBarColor,
        titleTextStyle: GoogleFonts.gochiHand(
            color: ColorConstants.secondaryTextColor, fontSize: 20),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
        unselectedItemColor: ColorConstants.secondaryTextColor,
        selectedItemColor: ColorConstants.primaryColor,
        backgroundColor: ColorConstants.appBarColor,
      ),
      textTheme: Typography.material2018().white.copyWith(
            bodyText1: GoogleFonts.goldman(),
            bodyText2: GoogleFonts.goldman(
                fontSize: 20, color: ColorConstants.primaryColor),
          ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: ColorConstants.primaryColor,
        unselectedLabelColor: ColorConstants.secondaryTextColor,
        labelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorConstants.secondaryTextColor,
      ),
      cardTheme: const CardTheme(
        color: ColorConstants.appBarColor,
        elevation: 200,
      ),
    );
  }

  static final pressedButtonTheme = ThemeData(
    textTheme: Typography.material2018().white.copyWith(
          headline6: GoogleFonts.goldman(
              fontSize: 40, color: Color.fromARGB(255, 130, 164, 193)),
        ),
  );
  static final notPressed = ThemeData(
    textTheme: Typography.material2018().white.copyWith(
          headline6: GoogleFonts.goldman(
              fontSize: 40, color: ColorConstants.primaryColor),
        ),
  );

  static ThemeData get prodTheme {
    return ThemeData(
      dividerColor: Color.fromARGB(255, 48, 95, 129),
      primaryColor: Colors.black,
      backgroundColor: Colors.grey,
      // scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      scaffoldBackgroundColor: Color.fromARGB(255, 26, 52, 74),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Color.fromARGB(255, 130, 164, 193),
        selectedLabelStyle: GoogleFonts.goldman(),
        unselectedLabelStyle: GoogleFonts.goldman(),
        backgroundColor: ColorConstants.appBarColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.appBarColor,
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
