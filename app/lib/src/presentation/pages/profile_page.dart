import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/providers/match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/big_avatar.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/player_profile_list_item.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';

import '../widgets/widgets.dart';

class ProfilePage extends ConsumerWidget with SetProfileImageMixin {
  final PlayerModel player;

  const ProfilePage({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          BigAvatar(
            imageUrl: setImage(player.imageUrl),
          ),
          const SizedBox(height: 20),
          NameCard(
            playerName: player.nickname,
            fullName: '${player.firstName} ${player.lastName}',
          ),
          const SizedBox(height: 12),
          const Text(
            'Rank: 1',
            style: TextStyle(
              color: ColorConstants.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 30),
          GameStats(
            wins: player.win.toString(),
            losses: player.loss.toString(),
          ),
          const SizedBox(height: 50),
          const Center(
            child: Text(
              'Latest games',
              style: TextStyle(
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: ref
                    .watch(singleMatchProvider.notifier)
                    .getMatchesByPlayerEmail(player.email)
                    .length,
                itemBuilder: (context, index) {
                  return PlayerProfileListItem(
                      match: ref
                          .watch(singleMatchProvider.notifier)
                          .getMatchesByPlayerEmail(player.email)[index]);
                }),
          ),
        ],
      ),
    );
  }
}
