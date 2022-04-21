import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  runApp(MyApp(
    themeDataLight: ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.pink,
    ),
    themeDataDark: ThemeData.dark(),
  ));
}
