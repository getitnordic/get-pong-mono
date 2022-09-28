import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/route/route.dart' as route;
import '../../../../constants/constants.dart';
import '../../../../enums/sorting_options.dart';
import '../../../../protos/protos.dart';
import '../../providers/top_ranks/top_ranks_providers.dart';
import 'player_ranking_header.dart';
import 'player_ranking_player.dart';

class PlayerRanking extends ConsumerStatefulWidget {
  const PlayerRanking({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerRankingState();
}

class _PlayerRankingState extends ConsumerState<PlayerRanking> {
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
                child: PlayerRankingHeader(
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
                      child: PlayerRankingPlayer(
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
