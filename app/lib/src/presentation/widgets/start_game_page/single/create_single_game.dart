import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/route/route.dart' as route;
import '../../../../../constants/color_constants.dart';
import '../../../../../enums/match_type.dart';
import '../../../../../enums/player_select_choice.dart';
import '../../../../../utils/mixins/format_date_mixin.dart';
import '../../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../../Presentation/providers/selected_players/selected_players_providers.dart';
import '../../../../core/models/score_page_arguments.dart';
import '../../../providers/players/players_providers.dart';
import '../../my_profile_image.dart';
import '../../widgets.dart';
import '../vs_bar.dart';

class CreateSingleGame extends ConsumerWidget
    with SetProfileImageMixin, FormatDateMixin {
  const CreateSingleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlayers = ref.watch(selectedPlayersProvider);
    final isAllSelected = selectedPlayers[0].nickname.isNotEmpty &&
        selectedPlayers[1].nickname.isNotEmpty &&
        selectedPlayers[0].id != selectedPlayers[1].id;

    double height(BuildContext context) => MediaQuery.of(context).size.height;

    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape &&
                MediaQuery.of(context).size.height > 400
            ? //Horizontal
            SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height(context) * 0.1),
                      child: SizedBox(
                        width: 450,
                        child: _selectedPlayersDisplay(
                          context: context,
                          ref: ref,
                          isAllSelected: isAllSelected,
                        ),
                      ),
                    ),
                    _buildHorizontalPlayersContainer(
                      context: context,
                      ref: ref,
                    ),
                  ],
                ),
              )
            :
            //Vertical
            SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: height(context) * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _selectedPlayersDisplay(
                        context: context,
                        ref: ref,
                        isAllSelected: isAllSelected,
                      ),
                      ref.watch(fetchPlayersProvider).when(
                            data: (_) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: _buildVerticalPlayersContainer(
                                  ref: ref,
                                ),
                              );
                            },
                            error: ((error, stackTrace) =>
                                Text('Error: $error')),
                            loading: () => const Padding(
                              padding: EdgeInsets.only(top: 80),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Stack _selectedPlayersDisplay({
    required BuildContext context,
    required WidgetRef ref,
    required bool isAllSelected,
  }) {
    final hasWidth = MediaQuery.of(context).size.width > 550;
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final winProbability = ref.watch(winProbabilityProvider);
    final selectedPlayers = ref.read(selectedPlayersProvider);
    final playersNotifier = ref.read(playersProvider.notifier);
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
                        text: playersNotifier
                            .getPlayerById(selectedPlayers[0].id)
                            .fullName),
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
                    arguments: PlayerSelectChoice.playerTwo,
                  );
                },
                child: selectedPlayers[1].fullName.isEmpty
                    ? const MyFadeTextSwitcher(text: 'Select player 1')
                    : MyFadeTextSwitcher(
                        text: playersNotifier
                            .getPlayerById(selectedPlayers[1].id)
                            .fullName),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 55),
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
                  onPressed: isAllSelected
                      ? () {
                          final arguments = ScorePageArguments(
                            players: selectedPlayers,
                            matchType: MatchType.single,
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
                top: 0,
                child: CustomSmallContainer(
                    height: 50,
                    width: 60,
                    child: MyFadeTextSwitcher(
                      text:
                          '${winProbability.toStringAsFixed(2).split('.')[1]}%',
                    )),
              )
            : const SizedBox.shrink(),
        isAllSelected && hasWidth
            ? Positioned(
                right: isPhoneOrVertical ? 35 : 0,
                top: 124,
                child: CustomSmallContainer(
                    height: 50,
                    width: 60,
                    child: MyFadeTextSwitcher(
                      text:
                          '${(1 - winProbability).toStringAsFixed(2).split('.')[1]}%',
                    )),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  CustomSmallContainer _buildHorizontalPlayersContainer({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    double height(BuildContext context) => MediaQuery.of(context).size.height;
    final selectedPlayersNotifier = ref.read(selectedPlayersProvider.notifier);
    final matchTypeNotifier = ref.read(matchTypeProvider.notifier);

    return CustomSmallContainer(
      height: height(context) * 0.65,
      width: 400,
      child: ref.watch(fetchPlayersProvider).when(
            data: (_) {
              final players =
                  ref.watch(playersProvider.notifier).getLatestPlayers();
              return ListView.builder(
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
                                        playerId: players[index].id,
                                        size: 30,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                            players[index].fullName,
                                            overflow: TextOverflow.fade,
                                            style: GoogleFonts.goldman(
                                              fontSize: 14,
                                              color: ColorConstants.textColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          formatDate(
                                            players[index]
                                                .lastActivity
                                                .toDateTime(),
                                          ),
                                          style: GoogleFonts.goldman(
                                            fontSize: 11,
                                            color: ColorConstants
                                                .secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                          matchTypeNotifier.update((state) =>
                                              state = MatchType.single);
                                          selectedPlayersNotifier.setPlayer(
                                            player: players[index],
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
                                        matchTypeNotifier.update((state) =>
                                            state = MatchType.single);
                                        selectedPlayersNotifier.setPlayer(
                                          player: players[index],
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
            },
            error: ((error, stackTrace) => Text('Error: $error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }

  CustomSmallContainer _buildVerticalPlayersContainer({
    required WidgetRef ref,
  }) {
    final players = ref.watch(playersProvider.notifier).getLatestPlayers();
    final selectedPlayersNotifier = ref.read(selectedPlayersProvider.notifier);
    final matchTypeNotifier = ref.read(matchTypeProvider.notifier);
    return CustomSmallContainer(
      height: 908,
      width: 400,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
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
                                playerId: players[index].id,
                                size: 30,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  players[index].fullName,
                                  style: GoogleFonts.goldman(
                                    fontSize: 14,
                                    color: ColorConstants.textColor,
                                  ),
                                ),
                                Text(
                                  formatDate(
                                    players[index].lastActivity.toDateTime(),
                                  ),
                                  style: GoogleFonts.goldman(
                                    fontSize: 11,
                                    color: ColorConstants.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomSmallContainer(
                              height: 30,
                              width: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: ColorConstants.textColor,
                                  textStyle: GoogleFonts.goldman(
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  matchTypeNotifier.update(
                                      (state) => state = MatchType.single);
                                  selectedPlayersNotifier.setPlayer(
                                    player: players[index],
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
                                foregroundColor: ColorConstants.textColor,
                                textStyle: GoogleFonts.goldman(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                matchTypeNotifier.update(
                                    (state) => state = MatchType.single);
                                selectedPlayersNotifier.setPlayer(
                                  player: players[index],
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
      ),
    );
  }
}
