import 'package:flutter/material.dart';

import 'config/themes/my_theme.dart';
import 'my_app.dart';

void main() {
  runApp(MyApp(
    ThemeData: Customtheme.mainTheme,
  ));
}



  // runApp(MyApp(
  //   themeDataLight: ThemeData(
  //     primarySwatch: Colors.deepPurple,
  //     accentColor: Colors.red,
  //   ),
  //   themeDataDark: ThemeData.dark(),
  // ));