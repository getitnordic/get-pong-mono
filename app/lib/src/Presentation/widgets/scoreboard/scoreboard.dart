import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/ping_pong_match_notifier.dart';
import 'package:get_pong/src/Presentation/widgets/scoreboard/scoreboard_list_item.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<PingPongMatch> matches = ref.watch(pingPongMatchProvider);

    return Container(
      padding: const EdgeInsets.all(8),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: double.infinity,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
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
                    return ScoreboardListItem(
                        match: matches[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
