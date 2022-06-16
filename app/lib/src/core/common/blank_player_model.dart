import 'package:get_pong/protos/base.pb.dart';

abstract class BlankPlayerModel {
  static PlayerModel player = PlayerModel(
    id: '',
    email: '',
    nickname: '',
    lastName: '',
    firstName: '',
    streakEnum: StreakEnum.NONE,
    imageUrl: '',
    streak: 0,
    totalScore: 0,
    azureAdId: '',
    loss: 0,
    win: 0,
  );
}
