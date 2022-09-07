import 'package:flutter/material.dart';

class VsBar extends StatelessWidget {
  const VsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 150,
          child: Divider(
            height: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Text('VS'),
        ),
        SizedBox(
          width: 150,
          child: Divider(
            height: 5,
          ),
        ),
      ],
    );
  }
}
