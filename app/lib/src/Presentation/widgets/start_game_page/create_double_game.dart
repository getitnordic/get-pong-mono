import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/route/route.dart' as route;
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
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
                  child: selected[0].nickname.isEmpty
                      ? Text(
                          'Select player 1',
                          style: GoogleFonts.goldman(
                              fontSize: 20, color: Colors.white70),
                        )
                      : Text(
                          playersNotifier
                              .getPlayerById(selected[0].id)
                              .nickname,
                          style: GoogleFonts.goldman(
                              fontSize: 20, color: Colors.white70),
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
                    child: selected[1].nickname.isEmpty
                        ? Text(
                            'Select player 2',
                            style: GoogleFonts.goldman(
                                fontSize: 20, color: Colors.white70),
                          )
                        : Text(
                            playersNotifier
                                .getPlayerById(selected[1].id)
                                .nickname,
                            style: GoogleFonts.goldman(
                                fontSize: 20, color: Colors.white70),
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      arguments: PlayerSelectChoice.playerThree,
                    );
                  },
                  child: selected[2].nickname.isEmpty
                      ? Text(
                          'Select player 3',
                          style: GoogleFonts.goldman(
                              fontSize: 20, color: Colors.white70),
                        )
                      : Text(
                          playersNotifier
                              .getPlayerById(selected[2].id)
                              .nickname,
                          style: GoogleFonts.goldman(
                              fontSize: 20, color: Colors.white70),
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
                    child: selected[3].nickname.isEmpty
                        ? Text(
                            'Select player 4',
                            style: GoogleFonts.goldman(
                                fontSize: 20, color: Colors.white70),
                          )
                        : Text(
                            playersNotifier
                                .getPlayerById(selected[3].id)
                                .nickname,
                            style: GoogleFonts.goldman(
                                fontSize: 20, color: Colors.white70),
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
            padding: const EdgeInsets.only(bottom: 50),
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
                      return const Color.fromARGB(255, 248, 114, 39);
                    } else if (states.contains(MaterialState.disabled)) {
                      return const Color(0xff8f8f90);
                    }
                    return const Color.fromARGB(255, 248, 114, 39);
                  },
                ),
              ),
              onPressed: isAllSelected
                  ? () {
                      matchType.update((state) => MatchType.double);
                      Navigator.pushNamed(
                        context,
                        route.scorePage,
                        arguments: selected,
                      );
                    }
                  : null,
              child: const Text('Start Game'),
            ),
          ),
        ),
      ],
    );
  }
}
