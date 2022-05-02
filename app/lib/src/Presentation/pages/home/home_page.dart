import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';
import '../../../../config/themes/theme.dart';
import '../../widgets/my_gameplay_button.dart';

final gameMenuProvider = StateNotifierProvider<IndexModel, int>((ref) {
  return IndexModel();
});

class IndexModel extends StateNotifier<int> {
  IndexModel() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  GameTypeButton(
                      currentIndex: ref.watch(gameMenuProvider) ?? 0,
                      onChange: (int index) {
                        ref.read(gameMenuProvider.notifier).setIndex(index);
                      }),
                  Center(
                    child: Text(
                      'Create Match ${ref.read(gameMenuProvider.notifier).state}',
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
              );
            },
          )),
      bottomNavigationBar: const MyBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
