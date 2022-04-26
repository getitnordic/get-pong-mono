import 'package:flutter/material.dart';

class MyVsDevider extends StatelessWidget {
  const MyVsDevider({Key? key, this.dividerColor}) : super(key: key);
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 10,
        ),
      ),
      Text(
        'VS',
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).dividerColor),
      ),
      Expanded(
        child: const Divider(
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 0,
        ),
      ),
    ]);
  }
}
