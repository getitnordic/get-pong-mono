import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String title;
  const BigButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }
}
