import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/src/Presentation/providers/selected_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/game_list_view.dart';

class ScoreboardMenu extends ConsumerStatefulWidget {
  const ScoreboardMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ScoreboardMenuState();
}

class _ScoreboardMenuState extends ConsumerState<ScoreboardMenu>
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
          indicatorColor: ColorConstants.primaryColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 315,
          child: TabBarView(controller: tabController, children: const [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GameListView(),
            ),
            Center(child: Text('Doubles')),
            Center(child: Text('Roundhouse')),
          ]),
        ),
      ],
    );
  }
}
