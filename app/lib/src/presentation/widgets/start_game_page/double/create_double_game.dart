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

class CreateDoubleGame extends ConsumerWidget
    with SetProfileImageMixin, FormatDateMixin {
  const CreateDoubleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final isAllSelected =
        ref.watch(selectedPlayersProvider)[0].nickname.isNotEmpty &&
            ref.watch(selectedPlayersProvider)[1].nickname.isNotEmpty &&
            ref.watch(selectedPlayersProvider)[2].nickname.isNotEmpty &&
            ref.watch(selectedPlayersProvider)[3].nickname.isNotEmpty;
    bool duplicatesDoesNotExist() {
      final players = ref.watch(selectedPlayersProvider);
      final newPlayers = ref.watch(selectedPlayersProvider).toSet().toList();
      if (players.length == newPlayers.length) {
        return true;
      }
      return false;
    }

    double height(BuildContext context) => MediaQuery.of(context).size.height;
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape &&
              MediaQuery.of(context).size.height > 400
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
                        padding: EdgeInsets.only(top: height(context) * 0.1),
                        child: SizedBox(
                          width: 450,
                          child: _selectPlayersDisplay(
                            context: context,
                            isAllSelected: isAllSelected,
                            ref: ref,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(300, 50)),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return ColorConstants.primaryColor;
                                  } else if (states
                                      .contains(MaterialState.disabled)) {
                                    return ColorConstants.disabledButtonColor;
                                  }
                                  return ColorConstants.primaryColor;
                                },
                              ),
                            ),
                            onPressed: isAllSelected && duplicatesDoesNotExist()
                                ? () {
                                    final arguments = ScorePageArguments(
                                      players:
                                          ref.watch(selectedPlayersProvider),
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: _buildHorizontalPlayerListContainer(
                          context: context,
                          ref: ref,
                        ),
                      ),
                    ],
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
                    padding: EdgeInsets.only(top: height(context) * 0.1),
                    child: _selectPlayersDisplay(
                      ref: ref,
                      context: context,
                      isAllSelected: isAllSelected,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(300, 50)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return ColorConstants.primaryColor;
                              } else if (states
                                  .contains(MaterialState.disabled)) {
                                return ColorConstants.disabledButtonColor;
                              }
                              return ColorConstants.primaryColor;
                            },
                          ),
                        ),
                        onPressed: isAllSelected && duplicatesDoesNotExist()
                            ? () {
                                final arguments = ScorePageArguments(
                                  players: ref.watch(selectedPlayersProvider),
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
                  _buildVerticalPlayerListContainer(ref: ref),
                ],
              ),
            );
    });
  }

  Stack _selectPlayersDisplay({
    required WidgetRef ref,
    required BuildContext context,
    required bool isAllSelected,
  }) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final hasWidth = MediaQuery.of(context).size.width > 550;
    return Stack(
      children: [
        Column(
          children: [
            CustomSmallContainer(
              width: 300,
              height: 50,
              child: TextButton(
                onPressed: () {
                  ref.watch(playersProvider.notifier).fetchPlayers();
                  ref
                      .watch(matchTypeProvider.notifier)
                      .update((state) => state = MatchType.double);
                  Navigator.pushNamed(
                    context,
                    route.playerListPage,
                    arguments: PlayerSelectChoice.playerOne,
                  );
                },
                child: ref.watch(selectedPlayersProvider)[0].fullName.isEmpty
                    ? const MyFadeTextSwitcher(text: 'Select player 1')
                    : MyFadeTextSwitcher(
                        text: playersNotifier
                            .getPlayerById(
                                ref.watch(selectedPlayersProvider)[0].id)
                            .fullName,
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
                    ref.watch(playersProvider.notifier).fetchPlayers();
                    ref
                        .watch(matchTypeProvider.notifier)
                        .update((state) => state = MatchType.double);
                    Navigator.pushNamed(
                      context,
                      route.playerListPage,
                      arguments: PlayerSelectChoice.playerTwo,
                    );
                  },
                  child: ref.watch(selectedPlayersProvider)[1].fullName.isEmpty
                      ? const MyFadeTextSwitcher(text: 'Select player 2')
                      : MyFadeTextSwitcher(
                          text: playersNotifier
                              .getPlayerById(
                                  ref.watch(selectedPlayersProvider)[1].id)
                              .fullName,
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
                  ref.watch(playersProvider.notifier).fetchPlayers();
                  ref
                      .watch(matchTypeProvider.notifier)
                      .update((state) => state = MatchType.double);
                  Navigator.pushNamed(
                    context,
                    route.playerListPage,
                    arguments: PlayerSelectChoice.playerThree,
                  );
                },
                child: ref.watch(selectedPlayersProvider)[2].fullName.isEmpty
                    ? const MyFadeTextSwitcher(text: 'Select player 3')
                    : MyFadeTextSwitcher(
                        text: playersNotifier
                            .getPlayerById(
                                ref.watch(selectedPlayersProvider)[2].id)
                            .fullName,
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
                    ref.watch(playersProvider.notifier).fetchPlayers();
                    ref
                        .watch(matchTypeProvider.notifier)
                        .update((state) => state = MatchType.double);
                    Navigator.pushNamed(
                      context,
                      route.playerListPage,
                      arguments: PlayerSelectChoice.playerFour,
                    );
                  },
                  child: ref.watch(selectedPlayersProvider)[3].fullName.isEmpty
                      ? const MyFadeTextSwitcher(text: 'Select player 4')
                      : MyFadeTextSwitcher(
                          text: playersNotifier
                              .getPlayerById(
                                  ref.watch(selectedPlayersProvider)[3].id)
                              .fullName,
                        ),
                ),
              ),
            ),
          ],
        ),
        isAllSelected && hasWidth
            ? Positioned(
                right: 0,
                top: 32,
                child: CustomSmallContainer(
                  height: 50,
                  width: 60,
                  child: MyFadeTextSwitcher(
                    text:
                        '${ref.watch(winProbabilityProvider).toStringAsFixed(2).split('.')[1]}%',
                  ),
                ),
              )
            : const SizedBox.shrink(),
        isAllSelected && hasWidth
            ? Positioned(
                right: 0,
                top: 215,
                child: CustomSmallContainer(
                  height: 50,
                  width: 60,
                  child: MyFadeTextSwitcher(
                    text:
                        '${(1 - ref.watch(winProbabilityProvider)).toStringAsFixed(2).split('.')[1]}%',
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Padding _buildVerticalPlayerListContainer({required WidgetRef ref}) {
    return ref.watch(fetchPlayersProvider).when(
          data: (_) {
            final players =
                ref.watch(playersProvider.notifier).getLatestPlayers();
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomSmallContainer(
                height: 1600,
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
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: MyProfileImage(
                                          playerId: players[index].id,
                                          size: 30,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                Column(
                                  children: [
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
                                                ref
                                                    .watch(matchTypeProvider
                                                        .notifier)
                                                    .update((state) => state =
                                                        MatchType.double);
                                                ref
                                                    .watch(
                                                        selectedPlayersProvider
                                                            .notifier)
                                                    .setPlayer(
                                                      player: players[index],
                                                      playerSelectChoice:
                                                          PlayerSelectChoice
                                                              .playerOne,
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
                                              ref
                                                  .watch(matchTypeProvider
                                                      .notifier)
                                                  .update((state) =>
                                                      state = MatchType.double);
                                              ref
                                                  .watch(selectedPlayersProvider
                                                      .notifier)
                                                  .setPlayer(
                                                    player: players[index],
                                                    playerSelectChoice:
                                                        PlayerSelectChoice
                                                            .playerTwo,
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
                                                  textStyle:
                                                      GoogleFonts.goldman(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  ref
                                                      .watch(matchTypeProvider
                                                          .notifier)
                                                      .update((state) => state =
                                                          MatchType.double);
                                                  ref
                                                      .watch(
                                                          selectedPlayersProvider
                                                              .notifier)
                                                      .setPlayer(
                                                        player: players[index],
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
                                                ref
                                                    .watch(matchTypeProvider
                                                        .notifier)
                                                    .update((state) => state =
                                                        MatchType.double);
                                                ref
                                                    .watch(
                                                        selectedPlayersProvider
                                                            .notifier)
                                                    .setPlayer(
                                                      player: players[index],
                                                      playerSelectChoice:
                                                          PlayerSelectChoice
                                                              .playerFour,
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
                ),
              ),
            );
          },
          error: ((error, stackTrace) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error: $error'),
              )),
          loading: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }

  CustomSmallContainer _buildHorizontalPlayerListContainer({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    double height(BuildContext context) => MediaQuery.of(context).size.height;
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
                                        Text(
                                          players[index].fullName,
                                          style: GoogleFonts.goldman(
                                            fontSize: 14,
                                            color: ColorConstants.textColor,
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
                                              ref
                                                  .watch(matchTypeProvider
                                                      .notifier)
                                                  .update((state) =>
                                                      state = MatchType.double);
                                              ref
                                                  .watch(selectedPlayersProvider
                                                      .notifier)
                                                  .setPlayer(
                                                    player: players[index],
                                                    playerSelectChoice:
                                                        PlayerSelectChoice
                                                            .playerOne,
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
                                            ref
                                                .watch(
                                                    matchTypeProvider.notifier)
                                                .update((state) =>
                                                    state = MatchType.double);
                                            ref
                                                .watch(selectedPlayersProvider
                                                    .notifier)
                                                .setPlayer(
                                                  player: players[index],
                                                  playerSelectChoice:
                                                      PlayerSelectChoice
                                                          .playerTwo,
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
                                                ref
                                                    .watch(matchTypeProvider
                                                        .notifier)
                                                    .update((state) => state =
                                                        MatchType.double);
                                                ref
                                                    .watch(
                                                        selectedPlayersProvider
                                                            .notifier)
                                                    .setPlayer(
                                                      player: players[index],
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
                                              ref
                                                  .watch(matchTypeProvider
                                                      .notifier)
                                                  .update((state) =>
                                                      state = MatchType.double);
                                              ref
                                                  .watch(selectedPlayersProvider
                                                      .notifier)
                                                  .setPlayer(
                                                    player: players[index],
                                                    playerSelectChoice:
                                                        PlayerSelectChoice
                                                            .playerFour,
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
            },
            error: ((error, stackTrace) => Text('Error: $error')),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
