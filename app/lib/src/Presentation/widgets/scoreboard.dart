import 'package:flutter/material.dart';
import 'package:get_pong/src/domain/entities/scoreboard_player.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ScoreBoard extends StatelessWidget {

  const ScoreBoard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final List<ScoreboardPlayer> players = [
      ScoreboardPlayer('Göran', 10, 24),
      ScoreboardPlayer('Erik', 100, 34),
      ScoreboardPlayer('Madonna', 25, 120),
      ScoreboardPlayer('Emma', 245, 78),
      ScoreboardPlayer('Gecko', 50, 50),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),
      ScoreboardPlayer('Murarn', 1, 0),

    ];

    players.sort((a, b) => b.wins.compareTo(a.wins));

    return Container(
      padding: const EdgeInsets.all(8),
        child: GlassmorphicContainer(
          width: double.infinity,
          height: double.infinity,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.center,
          border: 0.5,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 18),
                      child: const Text('Player'),
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('P'),
                          Text('W '),
                          Text('L '),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 3,
                color: Colors.white,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                          width: 200,
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
                                    players[index].name,
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${players[index].wins + players[index].losses}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              players[index].wins.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              players[index].losses.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            //  SmallCheckBox(),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
    );
  }
}
