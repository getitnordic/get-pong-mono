import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerListPage extends StatelessWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'GetPong',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(0.8),
        child: Column(children: [
          Center(child: Text('PlayerList')),
        ]),
      ),
    );
  }
}
