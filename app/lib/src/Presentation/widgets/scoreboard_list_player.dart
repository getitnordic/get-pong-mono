import 'package:flutter/material.dart';
import 'package:get_pong/src/domain/entities/scoreboard_player.dart';

class ScoreboardListPlayer extends StatelessWidget {
  const ScoreboardListPlayer({
    Key? key,
    required this.player,
    required this.index
  }) : super(key: key);

  final ScoreboardPlayer player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Row(
              children: [
                Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    player.name,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50,
              child: Text(
                '${player.wins + player.losses}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                player.wins.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                player.losses.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
