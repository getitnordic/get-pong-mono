import 'package:flutter/foundation.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/protos/player.pbgrpc.dart';
import 'package:get_pong/services/grpc_client.dart';
import 'package:grpc/grpc.dart';

class PlayerService {
  PlayerServiceClient client = PlayerServiceClient(GrpcClient.client);

  Future<GetPlayersReply?> getPlayers() async {
    final request = GetPlayersRequest();

    try {
      return await client.getPlayers(request);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<RegisterExternalReply?> addPlayer(PlayerModel player) async {
    final request = RegisterExternalRequest(
      firstName: player.firstName,
      lastName: player.lastName,
      nickname: player.nickname,
      email: player.email,
    );

    try {
      return await client.registerExternal(request);
    } on GrpcError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
