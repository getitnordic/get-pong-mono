import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/register_services.dart';

import 'config/themes/my_theme.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(ProviderScope(
    child: MyApp(
      themeData: Customtheme.mainTheme,
    ),
  ));
}
