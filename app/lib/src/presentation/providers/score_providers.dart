import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/score_page_set.dart';
import '../controllers/score_controller.dart';

final scoreProvider =
    StateNotifierProvider.autoDispose<ScoreController, List<ScorePageSet>>(
        (ref) => ScoreController(ref.read));

final setNotificationProvider = StateProvider.autoDispose<int>((ref) => 1);
final saveGameNotificationProvider =
    StateProvider.autoDispose<bool>((ref) => false);
