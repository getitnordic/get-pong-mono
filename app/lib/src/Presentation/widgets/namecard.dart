import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';

class NameCard extends StatelessWidget {
  final String playerName;
  final String fullName;
  const NameCard({Key? key, required this.playerName, required this.fullName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSmallContainer(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            playerName,
            style: const TextStyle(color: ColorConstants.textColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(fullName,
              style: const TextStyle(color: ColorConstants.textColor)),
        ),
      ],
    );
  }
}
