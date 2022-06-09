import 'package:get_pong/enums/streak_enum.dart';

class EnumMapper {
  static StreakEnum getStreakEnum(String value) {
    if (value == 'WIN') return StreakEnum.win;
    if (value == 'LOSS') return StreakEnum.loss;
    return StreakEnum.none;
  }
}
