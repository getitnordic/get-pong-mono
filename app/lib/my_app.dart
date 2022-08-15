import 'package:flutter/material.dart';

import '../../../config/route/route.dart' as route;

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.themeData}) : super(key: key);
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetPong',
      theme: themeData,
      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
    );
  }
}
