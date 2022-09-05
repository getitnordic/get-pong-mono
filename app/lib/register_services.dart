import 'package:get_it/get_it.dart';
import 'package:get_pong/src/data/clients/result_repository_impl.dart';
import 'package:get_pong/src/domain/clients/result_repository.dart';
import 'package:get_pong/src/domain/use_cases/games/get_games_by_id_usecase.dart';
import 'package:get_pong/src/domain/use_cases/players/update_profile_picture_usecase.dart';
import 'package:get_pong/src/domain/use_cases/results/get_result_by_game_id_usecase.dart';
import 'package:get_pong/src/domain/use_cases/results/get_results_by_player_id_usecase.dart';

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
  getIt.registerLazySingleton<ResultServiceClient>(
      () => ResultServiceClient(GrpcClient.client));

  //Repositories
  getIt.registerLazySingleton<PlayerRepository>(
      () => PlayerRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<GameRepository>(() => GameRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ResultRepository>(
      () => ResultRepositoryImpl(getIt()));

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

  //Result
  getIt.registerLazySingleton<GetResultByGameIdUseCase>(
      () => GetResultByGameIdUseCase(getIt()));
  getIt.registerLazySingleton<GetResultsByPlayerIdUseCase>(
      () => GetResultsByPlayerIdUseCase(getIt()));
}
