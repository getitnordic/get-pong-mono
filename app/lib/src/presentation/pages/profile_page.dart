import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/widgets/big_avatar.dart';
import 'package:get_pong/src/presentation/providers/matches_notifier.dart';
import 'package:get_pong/src/presentation/providers/players_notifier.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import 'package:get_pong/utils/mixins/validation_mixin.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/scoreboard/player_profile_list_item.dart';
import '../widgets/widgets.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final PlayerModel player;
  const ProfilePage({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with SetProfileImageMixin, ValidationMixin {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController imageController = TextEditingController();
    TextEditingController nicknameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Stack(
              clipBehavior: Clip.none,
              children: [
                BigAvatar(
                  imageUrl: setImage(widget.player.imageUrl),
                ),
                Positioned(
                  top: 120,
                  right: 80,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Set image URL',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            content: Form(
                              key: formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                controller: imageController,
                                decoration: const InputDecoration(
                                  labelText: 'Image',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: ColorConstants.formColor,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(100, 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorConstants.primaryColor),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.player.imageUrl = imageController.text;
                                  });
                                  ref
                                      .watch(playersProvider.notifier)
                                      .updatePlayer(widget.player);
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
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: ColorConstants.textColor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: NameCard(
                      playerName: widget.player.nickname,
                      fullName:
                          '${widget.player.firstName} ${widget.player.lastName}',
                    ),
                  ),
                  Positioned(
                    top: -3,
                    right: 30,
                    child: IconButton(
                      onPressed: () {
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: TextFormField(
                                  controller: nicknameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Nickname',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.formColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      validateNickname(value!),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(100, 40)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorConstants.primaryColor),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.player.nickname = nicknameController.text;
                                    });
                                    ref
                                        .watch(playersProvider.notifier)
                                        .updatePlayer(widget.player);
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
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: ColorConstants.textColor,
                        size: 25,
                      ),
                    ),
                  ),
                ],
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
              wins: widget.player.win.toString(),
              losses: widget.player.loss.toString(),
              streak: widget.player.streak.toString(),
              streakEnum: widget.player.streakEnum,
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
            Consumer(
              builder: (context, ref, child) {
                final data = ref.watch(playerGamesProvider(widget.player.id));

                return data.when(
                  error: (error, stackTrace) => Text('Error $error'),
                  loading: () => const CircularProgressIndicator(),
                  data: (data) => SizedBox(
                    height: 200,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length > 5 ? 5 : data.length,
                        itemBuilder: (context, index) {
                          return PlayerProfileListItem(match: data[index]);
                        }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
