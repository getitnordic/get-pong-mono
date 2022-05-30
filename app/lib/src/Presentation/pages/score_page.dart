// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/save_button.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../domain/entities/player.dart';

// class DummyObj {
//   final String id;

//   DummyObj({required this.id});
// }

class ScorePage extends ConsumerWidget {

  final List<String> selectedPlayersId;

  const ScorePage({
    Key? key,
    required this.selectedPlayersId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var playersNotifier = ref.watch(playersProvider.notifier);
    Player playerOne = playersNotifier.getPlayerById(selectedPlayersId[0]);
    Player playerTwo = playersNotifier.getPlayerById(selectedPlayersId[1]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Score'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 20, maxHeight: 1000),
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(height: 15),
            buildPlayerResultCard(playerOne.name),
            SizedBox(height: 15),
            SizedBox(height: 20),
            buildPlayerResultCard(playerTwo.name),
            SizedBox(height: 15),
            Center(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SaveButton(
                    buttonText: 'Save Result',
                  ),
                  SizedBox(height: 30),
                  SaveButton(
                    buttonText: 'Rematch',
                  ),
                ],
              ),

              // child: const Text('Go back to startGamePage'),
              // onPressed: () => Navigator.pushNamed(context, route.startGamePage,
              //     // arguments: 1337),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlayerResultCard(String playerName) => GlassmorphicContainer(
        width: 350,
        height: 150,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 1,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.07),
              Color(0xFFFFFFFF).withOpacity(0.07),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.51),
            Color((0xFFFFFFFF)).withOpacity(0.51),
          ],
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                playerName,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // SizedBox(height: 20),
                  Text(
                    'Enter Result',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  AddResultForm(),

                  // AddResultForm(),
                  // const SizedBox(width: 3),
                ],
              ),
            ],
          ),
        ),
      );
}
