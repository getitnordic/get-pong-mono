abstract class SetProfileImageMixin {
  String getImageUrl(String playerId) {
    return 'https://getpong.blob.core.windows.net/getpong/pp_id_$playerId.jpg';
  }
}
