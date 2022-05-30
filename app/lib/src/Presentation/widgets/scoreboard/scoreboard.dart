import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/ping_pong_match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/custom_container.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/scoreboard_list_item.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../config/route/route.dart' as route;

class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<PingPongMatch> matches = ref.watch(pingPongMatchProvider);

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                'Matches',
                style: TextStyle(color: Colors.white70),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                    context,
                    route.matchDetailsPage,
                    ),
                    child: ScoreboardListItem(
                        match: matches[index],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
