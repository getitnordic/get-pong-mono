import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';

class ResultCardSingle extends StatelessWidget {
  final Widget child;
  final String name;

  const ResultCardSingle({Key? key, required this.child, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width < 500;
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
              style: TextStyle(
                color: ColorConstants.textColor,
                fontSize: isPhone ? 11 : 14,
              ),
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
