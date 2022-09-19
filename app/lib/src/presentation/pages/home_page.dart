import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/color_constants.dart';
import '../../Presentation/widgets/rankings/player_ranking.dart';
import '../../Presentation/widgets/start_game_page/create_game_menu.dart';
import '../widgets/add_player_bottom_sheet.dart';
import '../widgets/widgets.dart';
import 'stats_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;
  final List _pages = const [
    CreateGameMenu(),
    Scoreboard(),
    PlayerRanking(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetPong'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddPlayerBottomSheet();
                },
              );
            },
            icon: const Icon(Icons.person_add),
            color: ColorConstants.primaryColor,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard),
            label: 'Scoreboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Rankings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
        onTap: _updateIndex,
      ),
    );
  }

  void _updateIndex(int value) async {
    setState(() {
      _currentIndex = value;
    });
  }
}
