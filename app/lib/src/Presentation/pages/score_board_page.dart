// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/save_button.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import '../providers/my_providers.dart';
import '../../../config/route/route.dart' as route;

class DummyObj {
  final String id;

  DummyObj({required this.id});
}

class ScoreBoardPage extends ConsumerWidget {
  // Ta in de valda spelarna som argument

  final Object? arguments;
  const ScoreBoardPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerProvider);

    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(minHeight: 20, maxHeight: 1000),
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Add your result',
            style: TextStyle(
              color: Colors.white,
            ),
            // style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 30),

          SizedBox(width: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'player 1',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          buildPlayerResultCard("anders svensson"),
          // SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'player 2',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          buildPlayerResultCard("olof"),
          // SizedBox(height: 15),
          Center(
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SaveButton(
                  buttonText: 'Save Result',
                ),
                SizedBox(height: 20),
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
    );
  }

  Widget buildPlayerResultCard(String playerName) => Container(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 0.1,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
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
