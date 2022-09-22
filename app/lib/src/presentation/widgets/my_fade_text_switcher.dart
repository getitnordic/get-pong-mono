import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color_constants.dart';

class MyFadeTextSwitcher extends StatelessWidget {
  final String text;
  const MyFadeTextSwitcher({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style:
            GoogleFonts.goldman(fontSize: 18, color: ColorConstants.textColor),
        key: ValueKey<String>(
          text,
        ),
      ),
    );
  }
}
