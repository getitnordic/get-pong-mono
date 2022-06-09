import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/widgets/start_game_page/roundhouse/select_roundhouse_list.dart';

class CreateRoundhouseGame extends ConsumerWidget {
  const CreateRoundhouseGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        SelectRoundhouseList(),
      ],
    );
  }
}
