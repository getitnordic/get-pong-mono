import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ResultCardContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const ResultCardContainer({Key? key, required this.child, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.center,
      border: 1,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.07),
            const Color(0xFFFFFFFF).withOpacity(0.07),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.51),
          const Color((0xFFFFFFFF)).withOpacity(0.51),
        ],
      ),
      child: child,
    );
  }
}
