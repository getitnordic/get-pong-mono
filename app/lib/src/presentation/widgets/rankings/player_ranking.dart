import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/src/presentation/widgets/rankings/player_ranking_list_player.dart';

import '../../../../config/route/route.dart' as route;
import '../../../Presentation/widgets/rankings/player_ranking_list_header.dart';
import '../../providers/players_notifier.dart';

class PlayerRanking extends ConsumerWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(topRanksProvider);

        return data.when(
          error: (error, stackTrace) => Text('Error $error'),
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 250),
            child: Center(child: CircularProgressIndicator()),
          ),
          data: (data) => Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(26, 10, 0, 10),
                child: PlayerRankingListHeader(),
              ),
              const Divider(
                height: 3,
                color: ColorConstants.dividerColor,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          route.profilePage,
                          arguments: data[index],
                        ),
                        child: PlayerRankingListPlayer(
                          player: data[index],
                          index: index,
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
