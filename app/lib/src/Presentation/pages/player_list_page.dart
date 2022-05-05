// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class PlayerListPage extends StatelessWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player List'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          SizedBox(height: 20),
          BigButton(title: 'Player List'),
          SizedBox(height: 50),
          SmallButton(),
          SizedBox(height: 20),
          ColumnTitle(),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              PlayerList(
                title: 'Anders Svensson',
                ranking: '1',
              ),
              PlayerList(title: 'Nikke andersson', ranking: '2'),
              // SmallCheckBox(),
            ],
          )
        ]),
      ),
    );
  }
}
// PlayerList(onTap: () => Navigator.pushNamed(context, route.homePage), title: 'Anders Svensson',),

// style: Theme.of(context).textTheme.bodyText1,



  //  FlatButton(
  //           child: const Text('Click to add Result'),
  //           onPressed: () => Navigator.pushNamed(context, route.resultPage),
  //         ),
  //         Button(
  //           child: const Text('Click to add player'),
  //           onPressed: () => Navigator.pushNamed(context, route.addPlayer),
  //         ),
  //       ],),

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Player List'),
  //     ),
  //     body: Center(
  //       child: ListView(children: [
  //         ElevatedButton(
  //           child: const Text('Click to add Result'),
  //           onPressed: () => Navigator.pushNamed(context, route.resultPage),
  //         ),
  //         Button(
  //           child: const Text('Click to add player'),
  //           onPressed: () => Navigator.pushNamed(context, route.addPlayer),
  //         ),
  //       ]),
  //     ),
  //   );
  // }