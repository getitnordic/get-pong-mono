import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateDoubleGame extends ConsumerWidget {
  const CreateDoubleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selected = ref.watch(selectedProvider);
    final matchType = ref.watch(matchTypeProvider.notifier);
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

    return Column(
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomSmallContainer(
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
                                fontSize: 18, color: ColorConstants.textColor),
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
                      arguments: PlayerSelectChoice.playerThree,
                    );
                  },
                  child: selected[2].fullName.isEmpty
                      ? Text(
                          'Select player 3',
                          style: GoogleFonts.goldman(
                              fontSize: 18, color: ColorConstants.textColor),
                        )
                      : Text(
                          playersNotifier
                              .getPlayerById(selected[2].id)
                              .fullName,
                          style: GoogleFonts.goldman(
                              fontSize: 18, color: ColorConstants.textColor),
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
                                fontSize: 18, color: ColorConstants.textColor),
                          )
                        : Text(
                            playersNotifier
                                .getPlayerById(selected[3].id)
                                .fullName,
                            style: GoogleFonts.goldman(
                                fontSize: 18, color: ColorConstants.textColor),
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
                      matchType.update((state) => MatchType.double);
                      Navigator.pushNamed(
                        context,
                        route.scorePage,
                        arguments: selected,
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
    );
  }
}
