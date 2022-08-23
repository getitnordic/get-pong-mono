import 'package:get_it/get_it.dart';
import 'package:get_pong/src/domain/use_cases/games/get_games_by_id_usecase.dart';
import 'package:get_pong/src/domain/use_cases/players/update_profile_picture_usecase.dart';

import 'protos/protos.dart';
import 'src/data/clients/clients.dart';
import 'src/domain/clients/clients.dart';
import 'src/domain/use_cases/use_cases.dart';

final getIt = GetIt.instance;

Future<void> initServices() async {
  //Api
  // clients
  getIt.registerLazySingleton<PlayerServiceClient>(
      () => PlayerServiceClient(GrpcClient.client));
  getIt.registerLazySingleton<GameServiceClient>(
      () => GameServiceClient(GrpcClient.client));

  //Repositories
  getIt.registerLazySingleton<PlayerRepository>(
      () => PlayerRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<GameRepository>(() => GameRepositoryImpl(getIt()));

  //Use cases
  //Player
  getIt.registerLazySingleton<GetPlayersUseCase>(
      () => GetPlayersUseCase(getIt()));
  getIt
      .registerLazySingleton<AddPlayerUseCase>(() => AddPlayerUseCase(getIt()));
  getIt.registerLazySingleton<UpdatePlayerUseCase>(
      () => UpdatePlayerUseCase(getIt()));
  getIt.registerLazySingleton<UpdateProfilePictureUseCase>(
      () => UpdateProfilePictureUseCase(getIt()));

  //Game
  getIt.registerLazySingleton<GetGamesUseCase>(() => GetGamesUseCase(getIt()));
  getIt.registerLazySingleton<SaveGameUseCase>(() => SaveGameUseCase(getIt()));
  getIt.registerLazySingleton<GetGamesByPlayerIdUseCase>(
      () => GetGamesByPlayerIdUseCase(getIt()));
}
