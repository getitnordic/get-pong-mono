import 'package:get_pong/enums/streak_enum.dart';

class Player {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String nickname;
  final int wins;
  final int losses;
  final int streak;
  final int totalScore;
  final String imageUrl;
  final StreakEnum streakEnum;

  const Player(
      this.id,
      this.nickname,
      this.wins,
      this.losses,
      this.imageUrl,
      this.firstName,
      this.lastName,
      this.email,
      this.streak,
      this.totalScore,
      this.streakEnum);
}
