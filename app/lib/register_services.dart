import 'package:get_it/get_it.dart';
import 'package:get_pong/protos/game.pbgrpc.dart';
import 'package:get_pong/protos/player.pbgrpc.dart';
import 'package:get_pong/src/data/clients/game_repository_impl.dart';
import 'package:get_pong/src/data/clients/grpc_client.dart';
import 'package:get_pong/src/data/clients/player_repository_impl.dart';
import 'package:get_pong/src/domain/clients/clients.dart';
import 'package:get_pong/src/domain/clients/game_repository.dart';
import 'package:get_pong/src/domain/use_cases/games/get_games.dart';
import 'package:get_pong/src/domain/use_cases/games/save_game.dart';
import 'package:get_pong/src/domain/use_cases/use_cases.dart';

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
  getIt.registerLazySingleton<GetPlayers>(() => GetPlayers(getIt()));
  getIt.registerLazySingleton<AddPlayer>(() => AddPlayer(getIt()));
  //Game
  getIt.registerLazySingleton<GetGames>(() => GetGames(getIt()));
  getIt.registerLazySingleton<SaveGame>(() => SaveGame(getIt()));
}
