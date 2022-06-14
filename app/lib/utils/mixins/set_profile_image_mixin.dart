abstract class SetProfileImageMixin {
  String setImage(String imageUrl) {
    return imageUrl.isNotEmpty
        ? imageUrl
        : 'https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1.jpg';
  }
}
