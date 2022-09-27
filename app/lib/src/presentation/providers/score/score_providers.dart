import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/score_page_set.dart';
import 'score_notifier.dart';

final scoreProvider =
    StateNotifierProvider.autoDispose<ScoreNotifier, List<ScorePageSet>>(
        (ref) => ScoreNotifier(ref.read));

final setNotificationProvider = StateProvider.autoDispose<int>((ref) => 1);
final saveGameNotificationProvider = StateProvider.autoDispose<bool>((ref) => false);