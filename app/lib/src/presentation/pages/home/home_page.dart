import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Column(
        children: [
          Text('olof', style: GoogleFonts.goldman()),
          const Center(child: Text('HOMEPAGE')),
          MyBigButton(buttonText: 'pressMe')
        ],
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
