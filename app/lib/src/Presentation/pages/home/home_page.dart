import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import '../../widgets/my_gameplay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const GameTypeButton(),
            const Center(
              child: Text(
                'Create Match',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            MyPlayerAvatar(
              title: 'test namn',
              onTap: () => print('hejehje'),
            ),
            const MyVsDevider(),
            MyPlayerAvatar(
              title: 'test namn',
              onTap: () => print('hejehje'),
            ),
            const MyBigButton(buttonText: 'create match'),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
