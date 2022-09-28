import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/protos/protos.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/constants.dart';
import '../../../../enums/sorting_options.dart';
import '../../../Presentation/widgets/rankings/player_ranking_list_header.dart';
import '../../providers/top_ranks/top_ranks_providers.dart';
import 'player_ranking_list_player.dart';

class PlayerRankingList extends ConsumerStatefulWidget {
  const PlayerRankingList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerRankingListState();
}

class _PlayerRankingListState extends ConsumerState<PlayerRankingList> {
  @override
  Widget build(BuildContext context) {
    List<PlayerModel> players = ref.watch(topRanksProvider);
    final playersController = ref.read(topRanksProvider.notifier);
    final isLoading = ref.watch(topRanksLoadingProvider);

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(26, 10, 0, 10),
                child: PlayerRankingListHeader(
                  onPressedLosses: () {
                    setState(() {
                      players = playersController
                          .sortPlayerList(SortingOptions.losses);
                    });
                  },
                  onPressedPlayed: () {
                    setState(() {
                      players = playersController
                          .sortPlayerList(SortingOptions.played);
                    });
                  },
                  onPressedPlayer: () {
                    setState(() {
                      players =
                          playersController.sortPlayerList(SortingOptions.name);
                    });
                  },
                  onPressedWins: () {
                    setState(() {
                      players =
                          playersController.sortPlayerList(SortingOptions.wins);
                    });
                  },
                  onPressedScore: () {
                    setState(() {
                      players = playersController
                          .sortPlayerList(SortingOptions.score);
                    });
                  },
                ),
              ),
              const Divider(
                height: 3,
                color: ColorConstants.dividerColor,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        route.profilePage,
                        arguments: players[index],
                      ),
                      child: PlayerRankingListPlayer(
                        player: players[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
