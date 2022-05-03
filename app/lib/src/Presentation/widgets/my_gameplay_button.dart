import 'package:flutter/material.dart';

// final colorProvider = StateProvider((ref) => Colors.white);

// class ChangeThemeState extends ChangeNotifier {
//   bool selectMode = false;

//   void enableSelectedMode() {
//     selectMode = true;
//     notifyListeners();
//   }

//   void enableUnselectedMode() {
//     selectMode = false;
//     notifyListeners();
//   }
// }

// final changeTheme = ChangeNotifierProvider.autoDispose((ref) {
//   return ChangeThemeState();
// });

class GameTypeButton extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onChange;
  const GameTypeButton({
    Key? key,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final statecolor = ref.watch(colorProvider);

    print(currentIndex);
    // final theme = Theme.of(context);
    // final currentTheme = ref.watch(changeTheme);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              return onChange(0);
              // if (isSelectedMode) {
              //   ref.read(changeTheme.notifier).enableSelectedMode();
              // } else {
              //   ref.read(changeTheme.notifier).enableUnselectedMode();
              // }
              // ref.read(colorProvider.notifier).state;
            },
            child: const Text('Single'),
            // isSelectedMode ? Texts.pressedButtonTheme : Texts.notPressed,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              print("Doubletrouble");
              return onChange(1);
            },
            child: const Text('Double'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              print("round in the house");
              return onChange(2);
            },
            child: const Text('RoundHouse'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
