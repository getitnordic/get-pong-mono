import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/pages/home/home_page.dart';
import 'package:get_pong/src/presentation/pages/playerList/player_list_page.dart';

// import 'config/themes/my_theme.dart';
// <<<<<<< HEAD
// import 'package:get_pong/src/Presentation/pages/home/home_page.dart';

// import 'config/themes/my_theme.dart';
// =======
// import 'package:get_pong/src/presentation/pages/pages.dart';
// >>>>>>> 6a03785e813181f5efb878518fe8fc0869fd91c2

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.themeData}) : super(key: key);
  final ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}

//FÖR KÖRA PROD BEHÖVS DESSA TEMAN:IN EFTER CLASS MYAPP EXTEMDS STATELESSWIDGET
  // final ThemeData themeDataLight;
  // final ThemeData themeDataDark;
  // const MyApp({
  //   Key? key,
  //   required this.themeDataLight,
  //   required this.themeDataDark,
  // }) : super(key: key);
