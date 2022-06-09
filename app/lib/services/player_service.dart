import 'package:flutter/foundation.dart';
import 'package:get_pong/protos/player.pbgrpc.dart';
import 'package:get_pong/services/grpc_client.dart';
import 'package:grpc/grpc.dart';

class PlayerService {
  final client = PlayerServiceClient(GrpcClient.client);

  Future<GetPlayersReply?> getPlayers() async {
    var request = GetPlayersRequest();

    try {
      return await client.getPlayers(request);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
