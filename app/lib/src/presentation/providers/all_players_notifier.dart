import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../protos/protos.dart';
import '../../../register_services.dart';
import '../../core/common/common.dart';
import '../../domain/use_cases/players/players.dart';

final allPlayersNewProvider =
    StateNotifierProvider<AllPlayersNotifier, List<PlayerModel>>(
        (ref) => AllPlayersNotifier([], getIt<GetPlayersUseCase>(), ref.read));

final allPlayersLoadingProvider = StateProvider<bool>((ref) => false);

class AllPlayersNotifier extends StateNotifier<List<PlayerModel>> {
  final UseCase getPlayersUseCase;
  final Reader read;

  AllPlayersNotifier(List<PlayerModel> state, this.getPlayersUseCase, this.read)
      : super([]);

  void getAllPlayers() async {
    _toggleLoading();

    await getPlayersUseCase(params: EmptyParams()).then((value) => {
          if (value is DataSuccess)
            {
              _toggleLoading(),
              state = value.data,
            }
          else
            {
              _toggleLoading(),
            }
        });
  }

  void _toggleLoading() {
    read(allPlayersLoadingProvider.notifier).state =
        !read(allPlayersLoadingProvider);
  }
}
