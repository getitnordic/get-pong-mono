import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NameCard extends StatelessWidget {
  final String playerName;
  const NameCard({Key? key, required this.playerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 200,
      height: 50,
      borderRadius: 15,
      blur: 20,
      alignment: Alignment.center,
      border: 0.5,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Text(
        (playerName),
        style: const TextStyle(color: ColorConstants.textColor),
      ),
    );
  }
}
