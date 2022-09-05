
import 'package:flutter/material.dart';

import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';

class BigAvatar extends StatelessWidget with SetProfileImageMixin{
  const BigAvatar({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 80,
      ),
    );
  }
}
