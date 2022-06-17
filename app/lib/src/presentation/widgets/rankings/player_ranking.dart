import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/src/presentation/widgets/rankings/player_ranking_list_player.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../enums/sorting_options.dart';
import '../../../Presentation/widgets/rankings/player_ranking_list_header.dart';
import '../../providers/players_notifier.dart';

class PlayerRanking extends ConsumerWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(playersLoadingProvider);
    final SortingOptions lastPressed = ref.watch(rankingPressedLastProvider);
    bool highToLow = ref.watch(rankingSortingTypeProvider);

    void toggleHighToLow() {
      highToLow
          ? ref
              .watch(rankingSortingTypeProvider.notifier)
              .update((state) => false)
          : ref
              .watch(rankingSortingTypeProvider.notifier)
              .update((state) => true);
    }

    void setLastPressed(SortingOptions option) {
      ref.watch(rankingPressedLastProvider.notifier).update((state) => option);
    }

    void sortByLosses() {
      if (lastPressed != SortingOptions.losses) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.losses, highToLow);
      setLastPressed(SortingOptions.losses);
      toggleHighToLow();
    }

    void sortByWins() {
      if (lastPressed != SortingOptions.wins) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.wins, highToLow);
      setLastPressed(SortingOptions.wins);
      toggleHighToLow();
    }

    void sortByName() {
      if (lastPressed != SortingOptions.name) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.name, highToLow);
      setLastPressed(SortingOptions.name);
      toggleHighToLow();
    }

    void sortByPlayed() {
      if (lastPressed != SortingOptions.played) {
        highToLow = true;
      }
      ref
          .watch(playersProvider.notifier)
          .sortPlayerList(SortingOptions.played, highToLow);
      setLastPressed(SortingOptions.played);
      toggleHighToLow();
    }

    return isLoading
        ? const Padding(
          padding: EdgeInsets.only(top: 250),
          child: Center(child: CircularProgressIndicator()),
        )
        : Column(
            children: [
              PlayerRankingListHeader(
                onPressedPlayer: sortByName,
                onPressedPlayed: sortByPlayed,
                onPressedWins: sortByWins,
                onPressedLosses: sortByLosses,
              ),
              const Divider(
                height: 3,
                color: ColorConstants.dividerColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: ref.watch(playersProvider).length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          route.profilePage,
                          arguments: ref.watch(playersProvider)[index],
                        ),
                        child: PlayerRankingListPlayer(
                          player: ref.watch(playersProvider)[index],
                          index: index,
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
