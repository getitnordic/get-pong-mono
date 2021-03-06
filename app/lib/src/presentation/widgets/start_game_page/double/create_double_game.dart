import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/score_page_arguments.dart';

class CreateDoubleGame extends ConsumerWidget with SetProfileImageMixin {
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 150,
                                  child: Divider(
                                    height: 5,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 20,
                                  ),
                                  child: Text('VS'),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Divider(
                                    height: 5,
                                  ),
                                ),
                              ],
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
                              data: (data) => CustomSmallContainer(
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
                                                  MainAxisAlignment.spaceAround,
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
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  setImage(data[
                                                                          index]
                                                                      .imageUrl)),
                                                          radius: 14,
                                                        ),
                                                      ),
                                                      Text(
                                                        data[index].fullName,
                                                        style:
                                                            GoogleFonts.goldman(
                                                          fontSize: 14,
                                                          color: ColorConstants
                                                              .textColor,
                                                        ),
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
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                selectedNotifier.setPlayer(
                                                                    player: data[
                                                                        index],
                                                                    playerSelectChoice:
                                                                        PlayerSelectChoice
                                                                            .playerOne);
                                                              },
                                                              child: Text(
                                                                '# 1',
                                                                style:
                                                                    GoogleFonts
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
                                                              selectedNotifier.setPlayer(
                                                                  player: data[
                                                                      index],
                                                                  playerSelectChoice:
                                                                      PlayerSelectChoice
                                                                          .playerTwo);
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
                                                                    horizontal:
                                                                        8),
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
                                                                  selectedNotifier.setPlayer(
                                                                      player: data[
                                                                          index],
                                                                      playerSelectChoice:
                                                                          PlayerSelectChoice
                                                                              .playerThree);
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
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                selectedNotifier.setPlayer(
                                                                    player: data[
                                                                        index],
                                                                    playerSelectChoice:
                                                                        PlayerSelectChoice
                                                                            .playerFour);
                                                              },
                                                              child: Text(
                                                                '# 4',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 150,
                              child: Divider(
                                height: 5,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 20,
                              ),
                              child: Text('VS'),
                            ),
                            SizedBox(
                              width: 150,
                              child: Divider(
                                height: 5,
                              ),
                            ),
                          ],
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
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(setImage(
                                                              data[index]
                                                                  .imageUrl)),
                                                      radius: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    data[index].fullName,
                                                    style: GoogleFonts.goldman(
                                                      fontSize: 14,
                                                      color: ColorConstants
                                                          .textColor,
                                                    ),
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
                                                            selectedNotifier.setPlayer(
                                                                player:
                                                                    data[index],
                                                                playerSelectChoice:
                                                                    PlayerSelectChoice
                                                                        .playerOne);
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
                                                          selectedNotifier.setPlayer(
                                                              player:
                                                                  data[index],
                                                              playerSelectChoice:
                                                                  PlayerSelectChoice
                                                                      .playerTwo);
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
                                                              selectedNotifier.setPlayer(
                                                                  player: data[
                                                                      index],
                                                                  playerSelectChoice:
                                                                      PlayerSelectChoice
                                                                          .playerThree);
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
                                                            selectedNotifier.setPlayer(
                                                                player:
                                                                    data[index],
                                                                playerSelectChoice:
                                                                    PlayerSelectChoice
                                                                        .playerFour);
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
