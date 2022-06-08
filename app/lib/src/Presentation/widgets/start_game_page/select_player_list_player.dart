import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/domain/entities/player.dart';

class SelectPlayerListPlayer extends ConsumerWidget {
  final Player player;
  final PlayerSelectChoice playerSelectIndex;

  const SelectPlayerListPlayer({
    Key? key,
    required this.player,
    required this.playerSelectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedNotifier = ref.watch(selectedProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSmallContainer(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(player.imageUrl),
                  ),
                ),
                Text(
                  player.nickname,
                  style: const TextStyle(
                    fontSize: 17,
                    color: ColorConstants.textColor,
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  selectedNotifier.setPlayer(
                      player: player, playerSelectChoice: playerSelectIndex);
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
