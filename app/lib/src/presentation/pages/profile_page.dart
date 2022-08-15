import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color_constants.dart';
import '../../../protos/base.pb.dart';
import '../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../utils/mixins/validation_mixin.dart';
import '../../Presentation/widgets/big_avatar.dart';
import '../providers/matches_notifier.dart';
import '../providers/players_notifier.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const iconSize = 30.0;
    final iconPosition = width * 0.88;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  BigAvatar(
                    imageUrl: setImage(widget.player.imageUrl),
                  ),
                  Positioned(
                    left: iconPosition,
                    child: Column(
                      children: [
                        IconButton(
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
                                  content: SizedBox(
                                    width: width * 0.80,
                                    child: Form(
                                      key: formKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: SizedBox(
                                        height: 90,
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
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          widget.player.imageUrl =
                                              imageController.text;
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
                            size: iconSize,
                          ),
                        ),
                        IconButton(
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
                                  content: SizedBox(
                                    width: width * 0.80,
                                    child: Form(
                                      key: formKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: SizedBox(
                                        height: 90,
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
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          widget.player.nickname =
                                              nicknameController.text;
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
                            size: iconSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: NameCard(
                playerName: widget.player.nickname,
                fullName:
                    widget.player.fullName,
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
                        itemCount: data.length,
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
