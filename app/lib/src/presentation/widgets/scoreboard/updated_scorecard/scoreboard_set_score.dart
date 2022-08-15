import 'package:flutter/material.dart';

class ScoreboardSetScore extends StatelessWidget {
  final String score;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const ScoreboardSetScore(
      {Key? key,
      required this.score,
      required this.width,
      required this.fontSize,
      required this.fontWeight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          score,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
