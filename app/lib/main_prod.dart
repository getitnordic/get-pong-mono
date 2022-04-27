import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/themes/my_theme.dart';
import 'my_app.dart';

// void main() {
//   runApp(MyApp(
//     themeData: Customtheme.prodTheme,
//   ));
// }

void main() {
  runApp(ProviderScope(
      child: MyApp(
    themeData: Customtheme.mainTheme,
  )));
}
