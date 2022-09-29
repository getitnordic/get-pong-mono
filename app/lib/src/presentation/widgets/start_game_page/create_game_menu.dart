import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/color_constants.dart';
import '../../../../enums/match_type.dart';
import '../../../Presentation/widgets/start_game_page/roundhouse/create_roundhouse_game.dart';
import '../../providers/selected_players_providers.dart';
import 'double/create_double_game.dart';
import 'single/create_single_game.dart';

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

  @override
  void initState() {
    final matchTypeController = ref.read(matchTypeProvider.notifier);
    matchTypeController.update((state) => MatchType.single);

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        if (tabController.index == 1) {
          matchTypeController.update((state) => MatchType.double);
        }
        if (tabController.index == 0) {
          matchTypeController.update((state) => MatchType.single);
        }
        ref.read(selectedPlayersProvider.notifier).resetState();
      }
    });
    super.initState();
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
              color: ColorConstants.textColor,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                controller: tabController,
                //isScrollable: true,
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
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    CreateSingleGame(),
                    CreateDoubleGame(),
                    CreateRoundhouseGame(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
