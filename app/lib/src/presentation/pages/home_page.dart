import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/pages/pages.dart';
import 'package:get_pong/src/Presentation/widgets/rankings/player_ranking.dart';

import '../providers/bottom_bar_index_provider.dart';
import '../providers/players_notifier.dart';
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
      body: SingleChildScrollView(
        child: renderContent(
            players: playerList, currentIndex: currentIndex.state),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.state,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_tennis),
              label: 'Spela',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.scoreboard),
              label: 'ScoreBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Spelare',
            ),
          ],
          onTap: (index) {
            if (index == 2) {
              ref.watch(playersProvider.notifier).fetchPlayers();
            }
            ref
                .read(bottomBarIndexProvider.notifier)
                .update((state) => state = index);
          }),
    );
  }
}
