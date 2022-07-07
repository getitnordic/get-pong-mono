import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/sorting_options.dart';

final rankingSortingTypeProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final rankingPressedLastProvider =
    StateProvider.autoDispose<SortingOptions>((ref) => SortingOptions.none);
