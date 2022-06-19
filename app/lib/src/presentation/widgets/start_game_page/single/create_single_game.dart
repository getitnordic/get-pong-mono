import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get_pong/config/route/route.dart' as route;
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/enums/match_type.dart';
import 'package:get_pong/enums/player_select_choice.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Presentation/providers/players_notifier.dart';
import '../../../../Presentation/providers/selected_notifier.dart';

class CreateSingleGame extends ConsumerWidget {
  const CreateSingleGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersNotifier = ref.watch(playersProvider.notifier);
    final selected = ref.watch(selectedProvider);
    final matchType = ref.watch(matchTypeProvider.notifier);
    final isAllSelected =
        selected[0].nickname.isNotEmpty && selected[1].nickname.isNotEmpty;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
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
                  child: selected[0].firstName.isEmpty
                      ? Text(
                          'Select player 1',
                          style: GoogleFonts.goldman(
                              fontSize: 18, color: ColorConstants.textColor),
                        )
                      : Text(
                          playersNotifier
                              .getPlayerById(selected[0].id)
                              .firstName,
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
                    Navigator.pushNamed(
                      context,
                      route.playerListPage,
                      arguments: PlayerSelectChoice.playerTwo,
                    );
                  },
                  child: selected[1].firstName.isEmpty
                      ? Text(
                          'Select player 2',
                          style: GoogleFonts.goldman(
                              fontSize: 18, color: ColorConstants.textColor),
                        )
                      : Text(
                          playersNotifier
                              .getPlayerById(selected[1].id)
                              .firstName,
                          style: GoogleFonts.goldman(
                              fontSize: 18, color: ColorConstants.textColor),
                        ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
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
                      matchType.update((state) => MatchType.single);
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
