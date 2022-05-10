import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/providers/my_providers.dart';
import '../route/route.dart' as route;
import '../widgets/widgets.dart';

class StartGamePage extends StatelessWidget {
  final Object? arguments;
  const StartGamePage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(arguments);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Create Match',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          // const GameTypeButton(
          //   onChange: (1){},
          //   currentIndex: 1,
          // ),
          MyPlayerAvatar(
            title: 'test namn',
            onTap: () => print('taptap'),
          ),
          const MyVsDevider(),
          MyPlayerAvatar(
            title: 'test namn',
            onTap: () => print('taptap'),
          ),
          const MyBigButton(buttonText: 'Start Game'),
        ],
      ),
    );
  }
}
