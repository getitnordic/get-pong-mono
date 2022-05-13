import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnTitle extends StatelessWidget {
  const ColumnTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Player List",
            style: GoogleFonts.goldman(
                fontSize: 15, color: Color.fromARGB(255, 130, 164, 193)),
          ),
          Text(
            "Ranking",
            style: GoogleFonts.goldman(
                fontSize: 15, color: Color.fromARGB(255, 130, 164, 193)),
          )
        ],
      ),
    );
  }
}
