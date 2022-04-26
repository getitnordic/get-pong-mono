import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 52, 74, 1),
      appBar: AppBar(title: const Text('HOME')),
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
            MyPlayerAvatar(title: 'test namn', onTap: () => print('hejehje')),
            MyBigButton(buttonText: 'pressMe'),
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