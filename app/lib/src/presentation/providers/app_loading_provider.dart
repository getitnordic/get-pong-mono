import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
