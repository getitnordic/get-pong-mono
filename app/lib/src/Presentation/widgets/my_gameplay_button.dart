import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = StateProvider((ref) => Colors.white);

class ChangeThemeState extends ChangeNotifier {
  bool selectMode = false;

  void enableSelectedMode() {
    selectMode = true;
    notifyListeners();
  }

  void enableUnselectedMode() {
    selectMode = false;
    notifyListeners();
  }
}

final changeTheme = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});

class GameTypeButton extends ConsumerWidget {
  const GameTypeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final statecolor = ref.watch(colorProvider);

    final isSelectedMode = ref.read(changeTheme).selectMode;
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
              if (isSelectedMode) {
                ref.read(changeTheme.notifier).enableSelectedMode();
              } else {
                ref.read(changeTheme.notifier).enableUnselectedMode();
              }
              // ref.read(colorProvider.notifier).state;
            },
            child: const Text('Single'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              print("Doubletrouble");
            },
            child: const Text('Double'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              print("round in the house");
            },
            child: const Text('RoundHous'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
