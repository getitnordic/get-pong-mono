import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';

class ResultCardSingle extends StatelessWidget {
  final Widget child;
  final String name;

  const ResultCardSingle({Key? key, required this.child, required this.name})
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
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: const TextStyle(
                color: ColorConstants.textColor,
                fontSize: 25,
              ),
            ),
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