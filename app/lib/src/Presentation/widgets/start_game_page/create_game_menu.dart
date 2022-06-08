import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';

import 'create_double_game.dart';
import 'create_single_game.dart';

class CreateGameMenu extends ConsumerStatefulWidget {
  const CreateGameMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CreateGameMenuState();
}

class _CreateGameMenuState extends ConsumerState<CreateGameMenu>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late SelectedNotifier selectedPlayersNotifier =
      ref.watch(selectedProvider.notifier);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        selectedPlayersNotifier.resetState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Create Match',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
        Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'Single',
                ),
                Tab(
                  text: 'Double',
                ),
                Tab(
                  text: 'Roundhouse',
                ),
              ],
              indicatorColor: const Color.fromARGB(255, 248, 114, 39),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: TabBarView(controller: tabController, children: const [
                CreateSingleGame(),
                CreateDoubleGame(),
                Center(child: Text('Roundhouse')),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
