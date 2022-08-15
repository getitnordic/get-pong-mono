import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/color_constants.dart';
import '../../../protos/base.pb.dart';
import '../../Presentation/pages/pages.dart';
import '../../Presentation/providers/bottom_bar_index_provider.dart';
import '../../Presentation/providers/players_notifier.dart';
import '../../Presentation/widgets/rankings/player_ranking.dart';
import '../providers/matches_notifier.dart';
import '../widgets/add_player_bottom_sheet.dart';
import '../widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

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
        return const StartGamePage();
      default:
        return const StartGamePage();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: renderContent(
        players: playerList,
        currentIndex: currentIndex.state,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.state,
          showUnselectedLabels: false,
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
          ],
          onTap: (index) async {
            if (index == 0) {}
            if (index == 1) {
              ref.watch(playersProvider.notifier).fetchPlayers();
              ref.watch(matchesProvider.notifier).fetchGames();
            }
            if (index == 2) {}
            ref
                .read(bottomBarIndexProvider.notifier)
                .update((state) => state = index);
          }),
    );
  }
}
