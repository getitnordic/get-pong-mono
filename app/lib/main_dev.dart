import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  runApp(MyApp(
    themeDataLight: ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.red,
    ),
    themeDataDark: ThemeData.dark(),
  ));
}
