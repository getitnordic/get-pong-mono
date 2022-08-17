import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';

class ResultCardDouble extends StatelessWidget {
  final Widget child;
  final String playerOne;
  final String playerTwo;

  const ResultCardDouble({
    Key? key,
    required this.child,
    required this.playerOne,
    required this.playerTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                playerOne,
                style: const TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                playerTwo,
                style: const TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
