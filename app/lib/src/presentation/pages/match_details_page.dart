import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/match_details_arguments.dart';
import '../providers/results_provider.dart';
import '../widgets/match_details/match_details_double.dart';
import '../widgets/match_details/match_details_single.dart';

class MatchDetailsPage extends ConsumerWidget {
  final MatchDetailsArguments arguments;
  const MatchDetailsPage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDouble = arguments.game.homeTeamIds.length == 2;
    final results = ref.watch(resultByGameIdProvider(arguments.game.id));
    final scoreChecker = arguments.scoreChecker;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),
      body: results.when(
        data: (results) {
          return isDouble
              ? MatchDetailsDouble(
                  results: results,
                  homeTeamOne: scoreChecker.homeTeamOne,
                  awayTeamOne: scoreChecker.awayTeamOne,
                  homeTeamTwo: scoreChecker.homeTeamTwo,
                  awayTeamTwo: scoreChecker.awayTeamTwo)
              : MatchDetailsSingle(
                  results: results,
                  homeTeam: scoreChecker.homeTeamOne,
                  awayTeam: scoreChecker.awayTeamOne,
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
