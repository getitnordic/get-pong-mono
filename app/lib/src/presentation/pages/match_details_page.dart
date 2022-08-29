import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/match_details_arguments.dart';
import '../providers/result_notifier.dart';
import '../widgets/match_details/match_details_single.dart';

class MatchDetailsPage extends ConsumerWidget {
  final MatchDetailsArguments arguments;
  const MatchDetailsPage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = arguments.game.homeTeamIds.length == 2;
    final results = ref.watch(resultByGameIdProvider(arguments.game.id));
    final controller = arguments.controller;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),
      body: results.when(
        data: (results) {
          return MatchDetailsSingle(
            results: results,
            homeTeam: controller.homeTeamOne,
            awayTeam: controller.awayTeamOne,
          );
        },
        error: (e, stack) => const Text('Error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
