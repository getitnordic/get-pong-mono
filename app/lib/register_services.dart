import 'package:get_it/get_it.dart';
import 'package:get_pong/src/data/clients/result_repository_impl.dart';
import 'package:get_pong/src/domain/clients/result_repository.dart';
import 'package:get_pong/src/domain/use_cases/games/get_games_by_id_usecase.dart';
import 'package:get_pong/src/domain/use_cases/games/get_win_probability_usecase.dart';
import 'package:get_pong/src/domain/use_cases/results/get_latest_results_usecase.dart';
import 'package:get_pong/src/domain/use_cases/results/get_result_by_game_id_usecase.dart';
import 'package:get_pong/src/domain/use_cases/results/get_results_by_player_id_usecase.dart';

import 'protos/protos.dart';
import 'src/data/clients/clients.dart';
import 'src/domain/clients/clients.dart';
import 'src/domain/use_cases/use_cases.dart';

final locator = GetIt.instance;

Future<void> initServices() async {
  //Api
  // clients
  locator.registerLazySingleton<PlayerServiceClient>(
      () => PlayerServiceClient(GrpcClient.client));
  locator.registerLazySingleton<GameServiceClient>(
      () => GameServiceClient(GrpcClient.client));
  locator.registerLazySingleton<ResultServiceClient>(
      () => ResultServiceClient(GrpcClient.client));

  //Repositories
  locator.registerLazySingleton<PlayerRepository>(
      () => PlayerRepositoryImpl(locator()));
  locator.registerLazySingleton<GameRepository>(
      () => GameRepositoryImpl(locator()));
  locator.registerLazySingleton<ResultRepository>(
      () => ResultRepositoryImpl(locator()));

  //Use cases
  //Player
  locator.registerLazySingleton<GetPlayersUseCase>(
      () => GetPlayersUseCase(locator()));
  locator.registerLazySingleton<AddPlayerUseCase>(
      () => AddPlayerUseCase(locator()));
  locator.registerLazySingleton<UpdatePlayerUseCase>(
      () => UpdatePlayerUseCase(locator()));
  locator.registerLazySingleton<UpdateProfilePictureUseCase>(
      () => UpdateProfilePictureUseCase(locator()));

  //Game
  locator
      .registerLazySingleton<GetGamesUseCase>(() => GetGamesUseCase(locator()));
  locator
      .registerLazySingleton<SaveGameUseCase>(() => SaveGameUseCase(locator()));
  locator.registerLazySingleton<GetGamesByPlayerIdUseCase>(
      () => GetGamesByPlayerIdUseCase(locator()));
  locator.registerLazySingleton<GetWinProbabilityUseCase>(
      () => GetWinProbabilityUseCase(locator()));

  //Result
  locator.registerLazySingleton<GetResultByGameIdUseCase>(
      () => GetResultByGameIdUseCase(locator()));
  locator.registerLazySingleton<GetResultsByPlayerIdUseCase>(
      () => GetResultsByPlayerIdUseCase(locator()));
  locator.registerLazySingleton<GetLatestResultsUseCase>(
      () => GetLatestResultsUseCase(locator()));
}
