import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/color_constants.dart';
import '../../../../protos/base.pb.dart';
import '../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../Presentation/widgets/custom_small_container.dart';
import '../my_profile_image.dart';

class SelectPlayerListPlayer extends ConsumerWidget with SetProfileImageMixin {
  final PlayerModel player;

  const SelectPlayerListPlayer({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
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
                    child: MyProfileImage(
                      playerId: player.id,
                      size: 25,
                    ),
                  ),
                  Text(
                    player.fullName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
