import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/core/models/score_page_arguments.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/presentation/providers/players_notifier.dart';
import '../../../../Presentation/providers/selected_notifier.dart';

class CreateSingleGame extends ConsumerWidget {
  const CreateSingleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selected = ref.watch(selectedProvider);
    final selectedNotifier = ref.watch(selectedProvider.notifier);
    final matchType = ref.watch(matchTypeProvider.notifier);
    final isAllSelected = selected[0].nickname.isNotEmpty &&
        selected[1].nickname.isNotEmpty &&
        selected[0].id != selected[1].id;

    double height(BuildContext context) => MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: height(context) * 0.1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                CustomSmallContainer(
                  width: 300,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      ref.watch(playersProvider.notifier).fetchPlayers();
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
                                fontSize: 18, color: ColorConstants.textColor),
                          )
                        : Text(
                            playersNotifier
                                .getPlayerById(selected[0].id)
                                .fullName,
                            style: GoogleFonts.goldman(
                                fontSize: 18, color: ColorConstants.textColor),
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
                      ref.watch(playersProvider.notifier).fetchPlayers();
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
                              color: ColorConstants.textColor,
                            ),
                          )
                        : Text(
                            playersNotifier
                                .getPlayerById(selected[1].id)
                                .fullName,
                            style: GoogleFonts.goldman(
                                fontSize: 18, color: ColorConstants.textColor),
                          ),
                  ),
                ),
              ],
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
                            players: selected,
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
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text('Latest Players'),
            ),
            Consumer(
              builder: (context, ref, child) {
                final data = ref.watch(latestPlayersProvider);

                return data.when(
                  error: (error, stackTrace) => Text('Error $error'),
                  loading: () => const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: CircularProgressIndicator(),
                  ),
                  data: (data) => SizedBox(
                    height: 750,
                    width: 400,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomSmallContainer(
                              height: 35,
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      data[index].fullName,
                                      style: GoogleFonts.goldman(
                                        fontSize: 14,
                                        color: ColorConstants.textColor,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: ColorConstants.primaryColor,
                                          textStyle: GoogleFonts.goldman(
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          selectedNotifier.setPlayer(
                                              player: data[index],
                                              playerSelectChoice:
                                                  PlayerSelectChoice.playerOne);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.numbers,
                                              size: 20,
                                            ),
                                            Text('1'),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: ColorConstants.primaryColor,
                                          textStyle: GoogleFonts.goldman(
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          selectedNotifier.setPlayer(
                                              player: data[index],
                                              playerSelectChoice:
                                                  PlayerSelectChoice.playerTwo);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.numbers,
                                              size: 20,
                                            ),
                                            Text('2'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
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
