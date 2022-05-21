import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/my_player_list.dart';
import 'package:get_pong/src/Presentation/widgets/selected_player_avatar.dart';
import '../../../config/route/route.dart' as route;
import '../../domain/entities/player.dart';
import '../providers/players_notifier.dart';
import '../providers/selected_players_notifier.dart';

class StartGamePage extends ConsumerWidget {
  final Object? arguments;
  const StartGamePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> playerList = ref.watch(playersProvider);
    List<String> selectedPlayers = ref.watch(selectedPlayersProvider);
    var playersNotifier = ref.watch(playersProvider.notifier);
    bool isOneSelected = selectedPlayers.isNotEmpty;
    bool isTwoSelected = selectedPlayers.length == 2;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Select Players',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(
            milliseconds: 300,
          ),
          child: SizedBox(
            height: selectedPlayers.isEmpty ? 0 : 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(isOneSelected)
                      SizedBox(
                        width: 150,
                        child: SelectedPlayerAvatar(
                          player: playersNotifier.getPlayerById(selectedPlayers[0]),
                        ),
                      ),
                    if(isOneSelected)
                      const Text('VS'),
                    if(isOneSelected)
                      SizedBox(
                          width: 150,
                          child: isTwoSelected ? SelectedPlayerAvatar(
                              player: playersNotifier.getPlayerById(selectedPlayers[1])
                          ) : null
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PlayerList(
            players: playerList,
            pageTitle: 'Select Players',
            selectedPlayers: selectedPlayers,
            listTitle: 'Select player',
            playerAction: (String id) {
              if (selectedPlayers.contains(id)) {
                // REMOVE
                ref.read(selectedPlayersProvider.notifier).removePlayerId(id);
                return;
              }
              // ADD
              ref.read(selectedPlayersProvider.notifier).addPlayerId(id);
            },
          )
        ),
        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 248, 114, 39);
                  } else if (states.contains(MaterialState.disabled)) {
                    return const Color(0xff8f8f90);
                  }
                  return const Color.fromARGB(255, 248, 114, 39);
                  },
                ),
              ),
                onPressed: selectedPlayers.length == 2 ? () => Navigator.pushNamed(
                  context,
                  route.scorePage,
                  arguments: selectedPlayers,
                ) : null,
                child: const Text('New Game'),
            ),
          ),
        )
      ],
    );
  }
}
