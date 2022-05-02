import 'package:flutter/material.dart';

class MyKeyboardUnfocus extends StatelessWidget {
  final Widget child;

  const MyKeyboardUnfocus({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails details) {
        if (details.velocity.pixelsPerSecond.dx.abs() > 100) {
          popKeyboard(context);
        }
      },
      onTap: () => popKeyboard(context),
      child: child,
    );
  }

  void popKeyboard(BuildContext context) {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
