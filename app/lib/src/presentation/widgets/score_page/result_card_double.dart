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
    bool isPhone = MediaQuery.of(context).size.width < 500;
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
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: isPhone ? 11 : 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                playerTwo,
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: isPhone ? 11 : 14,
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
