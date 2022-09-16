import 'package:get_pong/protos/protos.dart';
import 'package:get_pong/protos/result.pbgrpc.dart';

class StatsPageData {
  final List<ResultModel> results;
  final List<PlayerModel> players;
  final List<GameModel> games;

  StatsPageData({
    required this.results,
    required this.players,
    required this.games,
  });
}
