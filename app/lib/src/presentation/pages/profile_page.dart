import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/route/route.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/widgets/big_avatar.dart';
import 'package:get_pong/src/presentation/providers/players_notifier.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import 'package:get_pong/utils/mixins/validation_mixin.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';

class ProfilePage extends ConsumerWidget
    with SetProfileImageMixin, ValidationMixin {
  final PlayerModel player;

  const ProfilePage({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    TextEditingController contoller = TextEditingController();

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
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'Edit nickname',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      content: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          controller: contoller,
                          decoration: const InputDecoration(
                            labelText: 'Nickname',
                            prefixIcon: Icon(
                              Icons.person,
                              color: ColorConstants.formColor,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) => validateNickname(value!),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(100, 40)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorConstants.primaryColor),
                          ),
                          onPressed: () {
                            player.nickname = contoller.text;
                            ref
                                .watch(playersProvider.notifier)
                                .updatePlayer(player);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Submit',
                            style: GoogleFonts.goldman(
                              fontSize: 14,
                              color: ColorConstants.textColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: NameCard(
              playerName: player.nickname,
              fullName: '${player.firstName} ${player.lastName}',
            ),
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
          // Flexible(
          //   child: ListView.builder(
          //       itemCount: ref
          //           .watch(matchProvider.notifier)
          //           .getMatchesByPlayerId(player.id),
          //       itemBuilder: (context, index) {
          //         return PlayerProfileListItem(
          //             match: ref
          //                 .watch(matchProvider.notifier)
          //                 .getMatchesByPlayerId(player.id)[index]);
          //       }),
          // ),
        ],
      ),
    );
  }
}
