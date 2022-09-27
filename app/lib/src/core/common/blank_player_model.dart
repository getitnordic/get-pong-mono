import '../../../protos/base.pb.dart';

abstract class BlankPlayerModel {
  static final PlayerModel player = PlayerModel(
    id: '',
    email: '',
    nickname: '',
    fullName: '',
    streakEnum: StreakEnum.NONE,
    imageUrl: '',
    streak: 0,
    totalScore: 0,
    azureAdId: '',
    loss: 0,
    win: 0,
  );

  static List<PlayerModel> get emptyPlayerSelect =>
      [player, player, player, player];
}
