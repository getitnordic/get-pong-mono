import 'package:get_it/get_it.dart';
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

  //Game
  getIt.registerLazySingleton<GetGamesUseCase>(() => GetGamesUseCase(getIt()));
  getIt.registerLazySingleton<SaveGameUseCase>(() => SaveGameUseCase(getIt()));
}
