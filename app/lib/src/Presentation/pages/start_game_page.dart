import 'package:flutter/material.dart';
import '../route/route.dart' as route;
import '../widgets/widgets.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Rank 1'),
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      body: Padding(
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
              onTap: () => Navigator.pushNamed(context, route.playerListPage),
            ),
            const MyVsDevider(),
            MyPlayerAvatar(
              title: 'test namn',
              onTap: () => Navigator.pushNamed(context, route.playerListPage),
            ),
            const MyBigButton(buttonText: 'Start Game'),
          ],
        ),
      ),
    );
  }
}
