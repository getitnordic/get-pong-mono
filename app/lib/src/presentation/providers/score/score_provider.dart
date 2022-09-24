import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/score_page_set.dart';
import 'score_notifier.dart';

final scoreProvider =
    StateNotifierProvider.autoDispose<ScoreNotifier, List<ScorePageSet>>(
        (ref) => ScoreNotifier(ref.read));
