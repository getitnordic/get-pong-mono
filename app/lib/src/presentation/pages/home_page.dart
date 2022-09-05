import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/pages/stats_page.dart';
import 'package:get_pong/src/presentation/providers/all_players_notifier.dart';
import 'package:get_pong/src/presentation/providers/games_notifier.dart';
import 'package:get_pong/src/presentation/providers/result_notifier.dart';

import '../../../constants/color_constants.dart';
import '../../../protos/base.pb.dart';
import '../../Presentation/providers/bottom_bar_index_provider.dart';
import '../../Presentation/providers/players_notifier.dart';
import '../../Presentation/widgets/rankings/player_ranking.dart';
import '../../Presentation/widgets/start_game_page/create_game_menu.dart';
import '../providers/matches_notifier.dart';
import '../widgets/add_player_bottom_sheet.dart';
import '../widgets/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Widget renderContent({
    required List<PlayerModel> players,
    required int currentIndex,
  }) {
    switch (currentIndex) {
      case 1:
        return const Scoreboard();
      case 2:
        return const PlayerRanking();
      case 0:
        return const CreateGameMenu();
      default:
        return const CreateGameMenu();
    }
  }

  int _currentIndex = 0;
  final List _pages = const [
    CreateGameMenu(),
    Scoreboard(),
    PlayerRanking(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomBarIndexProvider.state);
    List<PlayerModel> playerList = ref.watch(playersProvider);

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
    if (value == 0) {}
    if (value == 1) {
      ref.watch(playersProvider.notifier).fetchPlayers();
      ref.watch(matchesProvider.notifier).fetchGames();
    }
    if (value == 3) {
      ref.watch(allPlayersNewProvider.notifier).getAllPlayers();
      ref.watch(gamesProvider.notifier).getAllGames();
      ref.watch(resultsProvider.notifier).fetchAllResults();
    }
  }
}
