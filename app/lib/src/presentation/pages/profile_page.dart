import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../config/route/route.dart' as route;
import '../../../constants/color_constants.dart';
import '../../../protos/base.pb.dart';
import '../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../utils/mixins/validation_mixin.dart';
import '../../core/models/update_profile_picture_params.dart';
import '../providers/games/games_providers.dart';
import '../providers/players/players_providers.dart';
import '../widgets/my_profile_image.dart';
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
  final ImagePicker _picker = ImagePicker();
  File? profilePicture;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nicknameController = TextEditingController();
    final width = MediaQuery.of(context).size.width;
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
                  profilePicture != null
                      ? Center(
                          child: CircleAvatar(
                            backgroundImage:
                                FileImage(File(profilePicture!.path)),
                            radius: 80,
                          ),
                        )
                      : Center(
                          child: MyProfileImage(
                            playerId: widget.player.id,
                            size: 140,
                          ),
                        ),
                  Positioned(
                    left: iconPosition,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showImageDialog();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: ColorConstants.textColor,
                            size: iconSize,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showNicknameDialog(
                                context, width, formKey, nicknameController);
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
              child: Column(
                children: [
                  CustomSmallContainer(
                    height: 40,
                    width: 200,
                    child: GestureDetector(
                      onTap: () => _showNicknameDialog(
                          context, width, formKey, nicknameController),
                      child: Text(
                        widget.player.nickname == 'nickname'
                            ? 'Add nickname'
                            : widget.player.nickname,
                        style: const TextStyle(color: ColorConstants.textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(widget.player.fullName,
                        style:
                            const TextStyle(color: ColorConstants.textColor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              ref
                  .read(playersProvider.notifier)
                  .getPlayerRank(widget.player.id),
              style: const TextStyle(
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
            const SizedBox(height: 30),
            CustomSmallContainer(
              width: 150,
              height: 35,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    route.playerStatsPage,
                    arguments: widget.player,
                  );
                },
                child: const Text(
                  'Show recent stats',
                  style: TextStyle(
                    color: ColorConstants.textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Latest games',
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
            ref.watch(fetchGamesProvider).when(
                data: (_) {
                  final games = ref
                      .watch(gamesProvider.notifier)
                      .getGamesByPlayerId(widget.player.id);
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: games.length,
                        itemBuilder: (context, index) {
                          return PlayerProfileListItem(match: games[index]);
                        }),
                  );
                },
                error: ((error, stackTrace) => Text('Error: $error')),
                loading: (() =>
                    const Center(child: CircularProgressIndicator())))
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showNicknameDialog(
    BuildContext context,
    double width,
    GlobalKey<FormState> formKey,
    TextEditingController nicknameController,
  ) {
    return showDialog(
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validator: (value) => validateNickname(value!),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(100, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorConstants.primaryColor),
              ),
              onPressed: () {
                setState(() {
                  widget.player.nickname = nicknameController.text;
                });
                ref.watch(playersProvider.notifier).updatePlayer(widget.player);
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
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 150,
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSmallContainer(
                  height: 50,
                  width: 250,
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () => _getImage(ImageSource.camera),
                      label: const Text('Take photo'),
                      icon: const Icon(
                        Icons.photo_camera,
                        color: ColorConstants.secondaryTextColor,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: ColorConstants.textColor,
                      ),
                    ),
                  ),
                ),
                CustomSmallContainer(
                  height: 50,
                  width: 250,
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () => _getImage(ImageSource.gallery),
                      label: const Text('Get image from gallery'),
                      icon: const Icon(
                        Icons.image,
                        color: ColorConstants.secondaryTextColor,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: ColorConstants.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _getImage(ImageSource source) async {
    XFile? photo = await _picker.pickImage(
      source: source,
      imageQuality: 90,
    );
    if (photo != null) {
      setState(() {
        profilePicture = File(photo.path);
      });

      final imageBytes = await profilePicture!.readAsBytes();
      final base64String = base64.encode(imageBytes);
      ref.watch(playersProvider.notifier).updateProfilePictureUseCase(
          params: UpdateProfilePictureParams(
              id: widget.player.id, data: base64String));
    }
  }
}
