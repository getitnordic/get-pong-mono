import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/themes/my_theme.dart';
import 'my_app.dart';

// void main() {
//   runApp((MyApp(
//     themeData: Customtheme.mainTheme,
//   )));
// }
class Player {
  const Player({
    required this.name,
    required this.email,
    required this.id,
  });
  final String name;
  final String email;
  final String id;

  Player copyWith({String? name, String? email}) {
    return Player(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier()
      : super([Player(name: 'olof', email: 'email@test.com', id: '1')]);

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void removePlayer(String playerId) {
    // state.removeWhere((p) => p.id == playerId);
    state = [
      for (final player in state)
        if (player.id != playerId) player,
    ];
  }
}

final playerProvider =
    StateNotifierProvider<PlayerNotifier, List<Player>>((ref) {
  return PlayerNotifier();
});

// final testProvider = StateProvider((ref) => 'testProvider');

void main() {
  runApp(ProviderScope(
    child: MyApp(
      themeData: Customtheme.mainTheme,
    ),
  ));
}

// =======
//     themeDataLight: ThemeData(
//       primarySwatch: Colors.blue,
//       accentColor: Colors.red,
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   selectedLabelStyle: GoogleFonts.goldman(),
      //   unselectedLabelStyle: GoogleFonts.goldman(),
      // ),
      // textTheme: Typography.material2018().white.copyWith(
      //       bodyText1: GoogleFonts.goldman(),
      //       bodyText2: GoogleFonts.goldman(),
      //     ),
//     ),
//     themeDataDark: ThemeData.dark(),
// >>>>>>> 6a03785e813181f5efb878518fe8fc0869fd91c2
//   ));




  // runApp(MyApp(
  //   themeDataLight: ThemeData(
  //     primarySwatch: Colors.deepPurple,
  //     accentColor: Colors.red,
  //   ),
  //   themeDataDark: ThemeData.dark(),
  // ));