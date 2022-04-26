import 'package:flutter/material.dart';

class MyVsDevider extends StatelessWidget {
  const MyVsDevider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 10,
          color: Colors.black,
        ),
      ),
      Text(
        'VS',
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: const Divider(
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 0,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
