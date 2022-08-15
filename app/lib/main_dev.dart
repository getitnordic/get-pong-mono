import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/themes/my_theme.dart';
import 'my_app.dart';
import 'register_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(ProviderScope(
    child: MyApp(
      themeData: Customtheme.mainTheme,
    ),
  ));
}
