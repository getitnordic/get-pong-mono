import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/pages/pages.dart';

class MyApp extends StatelessWidget {
  final ThemeData themeDataLight;
  final ThemeData themeDataDark;
  const MyApp({
    Key? key,
    required this.themeDataLight,
    required this.themeDataDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDataLight,
      darkTheme: themeDataDark,
      home: const HomePage(),
    );
  }
}
