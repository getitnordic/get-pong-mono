import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';

class ResultCardDouble extends StatelessWidget {
  final Widget child;
  final String playerOne;
  final String playerTwo;
  final String title;

  const ResultCardDouble(
      {Key? key,
      required this.child,
      required this.playerOne,
      required this.playerTwo,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: ColorConstants.textColor,
                fontSize: 25,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                playerOne,
                style: const TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 20,
                ),
              ),
              Text(
                playerTwo,
                style: const TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: <Widget>[
                const Text(
                  'Enter Result',
                  style: TextStyle(
                    color: ColorConstants.textColor,
                    fontSize: 15,
                  ),
                ),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}