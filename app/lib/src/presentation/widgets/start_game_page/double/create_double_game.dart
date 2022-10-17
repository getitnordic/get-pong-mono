import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/route/route.dart' as route;
import '../../../../../constants/color_constants.dart';
import '../../../../../enums/match_type.dart';
import '../../../../../enums/player_select_choice.dart';
import '../../../../../utils/mixins/format_date_mixin.dart';
import '../../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../../core/models/score_page_arguments.dart';
import '../../../providers/players_providers.dart';
import '../../../providers/selected_players_providers.dart';
import '../../my_profile_image.dart';
import '../../widgets.dart';
import '../vs_bar.dart';

class CreateDoubleGame extends ConsumerWidget
    with SetProfileImageMixin, FormatDateMixin {
  const CreateDoubleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape && screenHeight > 400
          ?
          //Horizontal
          SingleChildScrollView(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.1),
                        child: const SizedBox(
                          width: 450,
                          child: SelectedPlayersDisplayDoubles(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomSmallContainer(
                      height: screenHeight * 0.65,
                      width: 400,
                      child: LatestPlayersListViewDoubles(
                          orientation: orientation),
                    ),
                  ),
                ],
              ),
            )
          :
          //Vertical
          SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: const SelectedPlayersDisplayDoubles(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CustomSmallContainer(
                      height: 1600,
                      width: 400,
                      child: LatestPlayersListViewDoubles(
                          orientation: orientation),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}

class SelectedPlayersDisplayDoubles extends ConsumerWidget {
  const SelectedPlayersDisplayDoubles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlayers = ref.watch(selectedPlayersProvider);
    final playersController = ref.read(playersProvider.notifier);
    final winProbability = ref.watch(winProbabilityProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final isAllSelected = selectedPlayers[0].nickname.isNotEmpty &&
        selectedPlayers[1].nickname.isNotEmpty &&
        selectedPlayers[2].nickname.isNotEmpty &&
        selectedPlayers[3].nickname.isNotEmpty;

    final hasWidth = screenWidth > 550;
    final isPhoneOrVertical = screenWidth < 1000;

    bool duplicatesDoesNotExist() {
      final players = ref.read(selectedPlayersProvider);
      final newPlayers = ref.read(selectedPlayersProvider).toSet().toList();
      if (players.length == newPlayers.length) {
        return true;
      }
      return false;
    }

    return Stack(
      children: [
        Column(
          children: [
            CustomSmallContainer(
              width: 300,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    route.playerListPage,
                    arguments: PlayerSelectChoice.playerOne,
                  );
                },
                child: selectedPlayers[0].fullName.isEmpty
                    ? const MyFadeTextSwitcher(text: 'Select player 1')
                    : MyFadeTextSwitcher(
                        text: selectedPlayers[0].fullName,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomSmallContainer(
                width: 300,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      route.playerListPage,
                      arguments: PlayerSelectChoice.playerTwo,
                    );
                  },
                  child: selectedPlayers[1].fullName.isEmpty
                      ? const MyFadeTextSwitcher(text: 'Select player 2')
                      : MyFadeTextSwitcher(
                          text: selectedPlayers[1].fullName,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const VsBar(),
            const SizedBox(
              height: 25,
            ),
            CustomSmallContainer(
              width: 300,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    route.playerListPage,
                    arguments: PlayerSelectChoice.playerThree,
                  );
                },
                child: selectedPlayers[2].fullName.isEmpty
                    ? const MyFadeTextSwitcher(text: 'Select player 3')
                    : MyFadeTextSwitcher(
                        text: selectedPlayers[2].fullName,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomSmallContainer(
                width: 300,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      route.playerListPage,
                      arguments: PlayerSelectChoice.playerFour,
                    );
                  },
                  child: selectedPlayers[3].fullName.isEmpty
                      ? const MyFadeTextSwitcher(text: 'Select player 4')
                      : MyFadeTextSwitcher(
                          text: selectedPlayers[3].fullName,
                        ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(300, 50)),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return ColorConstants.primaryColor;
                        } else if (states.contains(MaterialState.disabled)) {
                          return ColorConstants.disabledButtonColor;
                        }
                        return ColorConstants.primaryColor;
                      },
                    ),
                  ),
                  onPressed: isAllSelected && duplicatesDoesNotExist()
                      ? () {
                          final arguments = ScorePageArguments(
                            players: selectedPlayers,
                            matchType: MatchType.double,
                          );
                          Navigator.pushNamed(
                            context,
                            route.scorePage,
                            arguments: arguments,
                          );
                        }
                      : null,
                  child: Text(
                    'Start Game',
                    style: GoogleFonts.goldman(
                      fontSize: 20,
                      color: ColorConstants.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        isAllSelected && hasWidth
            ? Positioned(
                right: isPhoneOrVertical ? 35 : 0,
                top: 32,
                child: CustomSmallContainer(
                  height: 50,
                  width: 60,
                  child: MyFadeTextSwitcher(
                    text: '${winProbability.toStringAsFixed(2).split('.')[1]}%',
                  ),
                ),
              )
            : const SizedBox.shrink(),
        isAllSelected && hasWidth
            ? Positioned(
                right: isPhoneOrVertical ? 35 : 0,
                top: 215,
                child: CustomSmallContainer(
                  height: 50,
                  width: 60,
                  child: MyFadeTextSwitcher(
                    text:
                        '${(1 - winProbability).toStringAsFixed(2).split('.')[1]}%',
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class LatestPlayersListViewDoubles extends ConsumerWidget with FormatDateMixin {
  final Orientation orientation;
  const LatestPlayersListViewDoubles({Key? key, required this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersController = ref.read(playersProvider.notifier);
    final selectedPlayersController =
        ref.read(selectedPlayersProvider.notifier);
    final isLoading = ref.watch(playersLoadingProvider);

    final players = playersController.getLatestPlayers();

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: orientation == Orientation.portrait
                ? const NeverScrollableScrollPhysics()
                : null,
            itemCount: players.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  route.profilePage,
                  arguments: players[index],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: MyProfileImage(
                                    playerId: playersController
                                        .getLatestPlayers()[index]
                                        .id,
                                    size: 30,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playersController
                                          .getLatestPlayers()[index]
                                          .fullName,
                                      style: GoogleFonts.goldman(
                                        fontSize: 14,
                                        color: ColorConstants.textColor,
                                      ),
                                    ),
                                    Text(
                                      formatDate(
                                        playersController
                                            .getLatestPlayers()[index]
                                            .lastActivity
                                            .toDateTime(),
                                      ),
                                      style: GoogleFonts.goldman(
                                        fontSize: 11,
                                        color:
                                            ColorConstants.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: CustomSmallContainer(
                                      height: 30,
                                      width: 50,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              ColorConstants.textColor,
                                          textStyle: GoogleFonts.goldman(
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          selectedPlayersController.setPlayer(
                                            player: playersController
                                                .getLatestPlayers()[index],
                                            playerSelectChoice:
                                                PlayerSelectChoice.playerOne,
                                          );
                                        },
                                        child: Text(
                                          '# 1',
                                          style: GoogleFonts.goldman(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomSmallContainer(
                                    height: 30,
                                    width: 50,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            ColorConstants.textColor,
                                        textStyle: GoogleFonts.goldman(
                                          fontSize: 20,
                                        ),
                                      ),
                                      onPressed: () {
                                        selectedPlayersController.setPlayer(
                                          player: playersController
                                              .getLatestPlayers()[index],
                                          playerSelectChoice:
                                              PlayerSelectChoice.playerTwo,
                                        );
                                      },
                                      child: Text(
                                        '# 2',
                                        style: GoogleFonts.goldman(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: CustomSmallContainer(
                                        height: 30,
                                        width: 50,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                ColorConstants.textColor,
                                            textStyle: GoogleFonts.goldman(
                                              fontSize: 20,
                                            ),
                                          ),
                                          onPressed: () {
                                            selectedPlayersController.setPlayer(
                                              player: playersController
                                                  .getLatestPlayers()[index],
                                              playerSelectChoice:
                                                  PlayerSelectChoice
                                                      .playerThree,
                                            );
                                          },
                                          child: Text(
                                            '# 3',
                                            style: GoogleFonts.goldman(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomSmallContainer(
                                      height: 30,
                                      width: 50,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              ColorConstants.textColor,
                                          textStyle: GoogleFonts.goldman(
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          selectedPlayersController.setPlayer(
                                            player: playersController
                                                .getLatestPlayers()[index],
                                            playerSelectChoice:
                                                PlayerSelectChoice.playerFour,
                                          );
                                        },
                                        child: Text(
                                          '# 4',
                                          style: GoogleFonts.goldman(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (index != players.length - 1)
                        const Divider(
                          height: 1,
                          indent: 13,
                          endIndent: 13,
                        ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
