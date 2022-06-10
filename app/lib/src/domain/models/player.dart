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

  const Player({
    required this.id,
    required this.nickname,
    required this.wins,
    required this.losses,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.streak,
    required this.totalScore,
    required this.streakEnum,
  });
}
