import 'package:flutter/material.dart';

import '../../presentation/widgets/my_add_player_form.dart';

class AddPlayerBottomSheet extends StatelessWidget {
  const AddPlayerBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 230,
      child: AddPlayerFields(),
    );
  }
}
