import 'package:get_pong/protos/protos.dart';

extension DisplayName on PlayerModel {
  bool _playerHasNickname() {
    return nickname != 'nickname' && nickname != '';
  }

  String displayName() {
    return _playerHasNickname() ? nickname : fullName;
  }
}
