import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/route/route.dart' as route;
import '../../../../../constants/color_constants.dart';
import '../../../../../enums/match_type.dart';
import '../../../../../enums/player_select_choice.dart';
import '../../../../../utils/mixins/format_date_mixin.dart';
import '../../../../../utils/mixins/set_profile_image_mixin.dart';
import '../../../../Presentation/providers/players_notifier.dart';
import '../../../../Presentation/widgets/custom_small_container.dart';
import '../../../../core/models/score_page_arguments.dart';
import '../../../providers/selected_notifier.dart';
import '../../my_profile_image.dart';
import '../vs_bar.dart';

class CreateDoubleGame extends ConsumerWidget
    with SetProfileImageMixin, FormatDateMixin {
  const CreateDoubleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selected = ref.watch(selectedProvider);
    final selectedNotifier = ref.watch(selectedProvider.notifier);
    final isAllSelected = selected[0].nickname.isNotEmpty &&
        selected[1].nickname.isNotEmpty &&
        selected[2].nickname.isNotEmpty &&
        selected[3].nickname.isNotEmpty;
    bool duplicatesDoesNotExist() {
      final players = selected;
      final newPlayers = selected.toSet().toList();
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
                        child: Column(
                          children: [
                            CustomSmallContainer(
                              width: 300,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .watch(playersProvider.notifier)
                                      .fetchPlayers();
                                  ref.watch(matchTypeProvider.notifier).update(
                                      (state) => state = MatchType.double);
                                  Navigator.pushNamed(
                                    context,
                                    route.playerListPage,
                                    arguments: PlayerSelectChoice.playerOne,
                                  );
                                },
                                child: selected[0].fullName.isEmpty
                                    ? Text(
                                        'Select player 1',
                                        style: GoogleFonts.goldman(
                                            fontSize: 18,
                                            color: ColorConstants.textColor),
                                      )
                                    : Text(
                                        playersNotifier
                                            .getPlayerById(selected[0].id)
                                            .fullName,
                                        style: GoogleFonts.goldman(
                                            fontSize: 18,
                                            color: ColorConstants.textColor),
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
                                    ref
                                        .watch(playersProvider.notifier)
                                        .fetchPlayers();
                                    ref
                                        .watch(matchTypeProvider.notifier)
                                        .update((state) =>
                                            state = MatchType.double);
                                    Navigator.pushNamed(
                                      context,
                                      route.playerListPage,
                                      arguments: PlayerSelectChoice.playerTwo,
                                    );
                                  },
                                  child: selected[1].fullName.isEmpty
                                      ? Text(
                                          'Select player 2',
                                          style: GoogleFonts.goldman(
                                              fontSize: 18,
                                              color: ColorConstants.textColor),
                                        )
                                      : Text(
                                          playersNotifier
                                              .getPlayerById(selected[1].id)
                                              .fullName,
                                          style: GoogleFonts.goldman(
                                              fontSize: 18,
                                              color: ColorConstants.textColor),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: isAllSelected
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Win probability: ',
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .textColor,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                '${ref.watch(winProbabilityProvider).toStringAsFixed(2).split('.')[1]}%',
                                                style: const TextStyle(
                                                    color: ColorConstants
                                                        .secondaryTextColor,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            const VsBar(),
                            SizedBox(
                              height: 25,
                              child: isAllSelected
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Win probability: ',
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .textColor,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                '${(1 - ref.watch(winProbabilityProvider)).toStringAsFixed(2).split('.')[1]}%',
                                                style: const TextStyle(
                                                    color: ColorConstants
                                                        .secondaryTextColor,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            CustomSmallContainer(
                              width: 300,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  ref
                                      .watch(playersProvider.notifier)
                                      .fetchPlayers();
                                  ref.watch(matchTypeProvider.notifier).update(
                                      (state) => state = MatchType.double);
                                  Navigator.pushNamed(
                                    context,
                                    route.playerListPage,
                                    arguments: PlayerSelectChoice.playerThree,
                                  );
                                },
                                child: selected[2].fullName.isEmpty
                                    ? Text(
                                        'Select player 3',
                                        style: GoogleFonts.goldman(
                                            fontSize: 18,
                                            color: ColorConstants.textColor),
                                      )
                                    : Text(
                                        playersNotifier
                                            .getPlayerById(selected[2].id)
                                            .fullName,
                                        style: GoogleFonts.goldman(
                                            fontSize: 18,
                                            color: ColorConstants.textColor),
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
                                    ref
                                        .watch(playersProvider.notifier)
                                        .fetchPlayers();
                                    ref
                                        .watch(matchTypeProvider.notifier)
                                        .update((state) =>
                                            state = MatchType.double);
                                    Navigator.pushNamed(
                                      context,
                                      route.playerListPage,
                                      arguments: PlayerSelectChoice.playerFour,
                                    );
                                  },
                                  child: selected[3].fullName.isEmpty
                                      ? Text(
                                          'Select player 4',
                                          style: GoogleFonts.goldman(
                                              fontSize: 18,
                                              color: ColorConstants.textColor),
                                        )
                                      : Text(
                                          playersNotifier
                                              .getPlayerById(selected[3].id)
                                              .fullName,
                                          style: GoogleFonts.goldman(
                                              fontSize: 18,
                                              color: ColorConstants.textColor),
                                        ),
                                ),
                              ),
                            ),
                          ],
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
                                      players: selected,
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
                        padding: const EdgeInsets.only(top: 10),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final data = ref.watch(latestPlayersProvider);

                            return data.when(
                              error: (error, stackTrace) =>
                                  Text('Error $error'),
                              loading: () => const Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: CircularProgressIndicator(),
                              ),
                              data: (data) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: CustomSmallContainer(
                                  height: height(context) * 0.65,
                                  width: 400,
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          route.profilePage,
                                          arguments: data[index],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: 220,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: MyProfileImage(
                                                            playerId:
                                                                data[index].id,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              data[index]
                                                                  .fullName,
                                                              style: GoogleFonts
                                                                  .goldman(
                                                                fontSize: 14,
                                                                color: ColorConstants
                                                                    .textColor,
                                                              ),
                                                            ),
                                                            Text(
                                                              formatDate(
                                                                data[index]
                                                                    .lastActivity
                                                                    .toDateTime(),
                                                              ),
                                                              style: GoogleFonts
                                                                  .goldman(
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
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child:
                                                                CustomSmallContainer(
                                                              height: 30,
                                                              width: 50,
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      ColorConstants
                                                                          .textColor,
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .goldman(
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  ref
                                                                      .watch(matchTypeProvider
                                                                          .notifier)
                                                                      .update((state) =>
                                                                          state =
                                                                              MatchType.double);
                                                                  selectedNotifier
                                                                      .setPlayer(
                                                                    player: data[
                                                                        index],
                                                                    playerSelectChoice:
                                                                        PlayerSelectChoice
                                                                            .playerOne,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  '# 1',
                                                                  style: GoogleFonts
                                                                      .goldman(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          CustomSmallContainer(
                                                            height: 30,
                                                            width: 50,
                                                            child: TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary:
                                                                    ColorConstants
                                                                        .textColor,
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .goldman(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                ref
                                                                    .watch(matchTypeProvider
                                                                        .notifier)
                                                                    .update((state) =>
                                                                        state =
                                                                            MatchType.double);
                                                                selectedNotifier
                                                                    .setPlayer(
                                                                  player: data[
                                                                      index],
                                                                  playerSelectChoice:
                                                                      PlayerSelectChoice
                                                                          .playerTwo,
                                                                );
                                                              },
                                                              child: Text(
                                                                '# 2',
                                                                style:
                                                                    GoogleFonts
                                                                        .goldman(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 8),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child:
                                                                  CustomSmallContainer(
                                                                height: 30,
                                                                width: 50,
                                                                child:
                                                                    TextButton(
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    primary:
                                                                        ColorConstants
                                                                            .textColor,
                                                                    textStyle:
                                                                        GoogleFonts
                                                                            .goldman(
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    ref
                                                                        .watch(matchTypeProvider
                                                                            .notifier)
                                                                        .update((state) =>
                                                                            state =
                                                                                MatchType.double);
                                                                    selectedNotifier
                                                                        .setPlayer(
                                                                      player: data[
                                                                          index],
                                                                      playerSelectChoice:
                                                                          PlayerSelectChoice
                                                                              .playerThree,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    '# 3',
                                                                    style: GoogleFonts
                                                                        .goldman(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            CustomSmallContainer(
                                                              height: 30,
                                                              width: 50,
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      ColorConstants
                                                                          .textColor,
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .goldman(
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  ref
                                                                      .watch(matchTypeProvider
                                                                          .notifier)
                                                                      .update((state) =>
                                                                          state =
                                                                              MatchType.double);
                                                                  selectedNotifier
                                                                      .setPlayer(
                                                                    player: data[
                                                                        index],
                                                                    playerSelectChoice:
                                                                        PlayerSelectChoice
                                                                            .playerFour,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  '# 4',
                                                                  style: GoogleFonts
                                                                      .goldman(
                                                                    fontSize:
                                                                        14,
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
                                              if (index != data.length - 1)
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
                              ),
                            );
                          },
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
                    child: Column(
                      children: [
                        CustomSmallContainer(
                          width: 300,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              ref
                                  .watch(playersProvider.notifier)
                                  .fetchPlayers();
                              Navigator.pushNamed(
                                context,
                                route.playerListPage,
                                arguments: PlayerSelectChoice.playerOne,
                              );
                            },
                            child: selected[0].fullName.isEmpty
                                ? Text(
                                    'Select player 1',
                                    style: GoogleFonts.goldman(
                                        fontSize: 18,
                                        color: ColorConstants.textColor),
                                  )
                                : Text(
                                    playersNotifier
                                        .getPlayerById(selected[0].id)
                                        .fullName,
                                    style: GoogleFonts.goldman(
                                        fontSize: 18,
                                        color: ColorConstants.textColor),
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
                                ref
                                    .watch(playersProvider.notifier)
                                    .fetchPlayers();
                                Navigator.pushNamed(
                                  context,
                                  route.playerListPage,
                                  arguments: PlayerSelectChoice.playerTwo,
                                );
                              },
                              child: selected[1].fullName.isEmpty
                                  ? Text(
                                      'Select player 2',
                                      style: GoogleFonts.goldman(
                                          fontSize: 18,
                                          color: ColorConstants.textColor),
                                    )
                                  : Text(
                                      playersNotifier
                                          .getPlayerById(selected[1].id)
                                          .fullName,
                                      style: GoogleFonts.goldman(
                                          fontSize: 18,
                                          color: ColorConstants.textColor),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: isAllSelected
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Win probability: ',
                                            style: TextStyle(
                                                color: ColorConstants.textColor,
                                                fontSize: 11),
                                          ),
                                          Text(
                                            '${ref.watch(winProbabilityProvider).toStringAsFixed(2).split('.')[1]}%',
                                            style: const TextStyle(
                                                color: ColorConstants
                                                    .secondaryTextColor,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                        const VsBar(),
                        SizedBox(
                          height: 25,
                          child: isAllSelected
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Win probability: ',
                                            style: TextStyle(
                                                color: ColorConstants.textColor,
                                                fontSize: 11),
                                          ),
                                          Text(
                                            '${(1 - ref.watch(winProbabilityProvider)).toStringAsFixed(2).split('.')[1]}%',
                                            style: const TextStyle(
                                                color: ColorConstants
                                                    .secondaryTextColor,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                        CustomSmallContainer(
                          width: 300,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              ref
                                  .watch(playersProvider.notifier)
                                  .fetchPlayers();
                              Navigator.pushNamed(
                                context,
                                route.playerListPage,
                                arguments: PlayerSelectChoice.playerThree,
                              );
                            },
                            child: selected[2].fullName.isEmpty
                                ? Text(
                                    'Select player 3',
                                    style: GoogleFonts.goldman(
                                        fontSize: 18,
                                        color: ColorConstants.textColor),
                                  )
                                : Text(
                                    playersNotifier
                                        .getPlayerById(selected[2].id)
                                        .fullName,
                                    style: GoogleFonts.goldman(
                                        fontSize: 18,
                                        color: ColorConstants.textColor),
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
                                ref
                                    .watch(playersProvider.notifier)
                                    .fetchPlayers();
                                Navigator.pushNamed(
                                  context,
                                  route.playerListPage,
                                  arguments: PlayerSelectChoice.playerFour,
                                );
                              },
                              child: selected[3].fullName.isEmpty
                                  ? Text(
                                      'Select player 4',
                                      style: GoogleFonts.goldman(
                                          fontSize: 18,
                                          color: ColorConstants.textColor),
                                    )
                                  : Text(
                                      playersNotifier
                                          .getPlayerById(selected[3].id)
                                          .fullName,
                                      style: GoogleFonts.goldman(
                                          fontSize: 18,
                                          color: ColorConstants.textColor),
                                    ),
                            ),
                          ),
                        ),
                      ],
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
                                  players: selected,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final data = ref.watch(latestPlayersProvider);

                        return data.when(
                          error: (error, stackTrace) => Text('Error $error'),
                          loading: () => const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: CircularProgressIndicator(),
                          ),
                          data: (data) => CustomSmallContainer(
                            height: 1600,
                            width: 400,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    route.profilePage,
                                    arguments: data[index],
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: 220,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: MyProfileImage(
                                                      playerId: data[index].id,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        data[index].fullName,
                                                        style:
                                                            GoogleFonts.goldman(
                                                          fontSize: 14,
                                                          color: ColorConstants
                                                              .textColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        formatDate(
                                                          data[index]
                                                              .lastActivity
                                                              .toDateTime(),
                                                        ),
                                                        style:
                                                            GoogleFonts.goldman(
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child:
                                                          CustomSmallContainer(
                                                        height: 30,
                                                        width: 50,
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary:
                                                                ColorConstants
                                                                    .textColor,
                                                            textStyle:
                                                                GoogleFonts
                                                                    .goldman(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            ref
                                                                .watch(
                                                                    matchTypeProvider
                                                                        .notifier)
                                                                .update((state) =>
                                                                    state = MatchType
                                                                        .double);
                                                            selectedNotifier
                                                                .setPlayer(
                                                              player:
                                                                  data[index],
                                                              playerSelectChoice:
                                                                  PlayerSelectChoice
                                                                      .playerOne,
                                                            );
                                                          },
                                                          child: Text(
                                                            '# 1',
                                                            style: GoogleFonts
                                                                .goldman(
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
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary:
                                                              ColorConstants
                                                                  .textColor,
                                                          textStyle: GoogleFonts
                                                              .goldman(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          ref
                                                              .watch(
                                                                  matchTypeProvider
                                                                      .notifier)
                                                              .update((state) =>
                                                                  state = MatchType
                                                                      .double);
                                                          selectedNotifier
                                                              .setPlayer(
                                                            player: data[index],
                                                            playerSelectChoice:
                                                                PlayerSelectChoice
                                                                    .playerTwo,
                                                          );
                                                        },
                                                        child: Text(
                                                          '# 2',
                                                          style: GoogleFonts
                                                              .goldman(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8),
                                                        child:
                                                            CustomSmallContainer(
                                                          height: 30,
                                                          width: 50,
                                                          child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              primary:
                                                                  ColorConstants
                                                                      .textColor,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .goldman(
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              ref
                                                                  .watch(matchTypeProvider
                                                                      .notifier)
                                                                  .update((state) =>
                                                                      state = MatchType
                                                                          .double);
                                                              selectedNotifier
                                                                  .setPlayer(
                                                                player:
                                                                    data[index],
                                                                playerSelectChoice:
                                                                    PlayerSelectChoice
                                                                        .playerThree,
                                                              );
                                                            },
                                                            child: Text(
                                                              '# 3',
                                                              style: GoogleFonts
                                                                  .goldman(
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
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary:
                                                                ColorConstants
                                                                    .textColor,
                                                            textStyle:
                                                                GoogleFonts
                                                                    .goldman(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            ref
                                                                .watch(
                                                                    matchTypeProvider
                                                                        .notifier)
                                                                .update((state) =>
                                                                    state = MatchType
                                                                        .double);
                                                            selectedNotifier
                                                                .setPlayer(
                                                              player:
                                                                  data[index],
                                                              playerSelectChoice:
                                                                  PlayerSelectChoice
                                                                      .playerFour,
                                                            );
                                                          },
                                                          child: Text(
                                                            '# 4',
                                                            style: GoogleFonts
                                                                .goldman(
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
                                        if (index != data.length - 1)
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
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
