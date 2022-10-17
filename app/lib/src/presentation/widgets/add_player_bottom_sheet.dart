import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../presentation/widgets/my_add_player_form.dart';

class AddPlayerBottomSheet extends StatelessWidget {
  const AddPlayerBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Add player',
              style: TextStyle(color: ColorConstants.textColor, fontSize: 20),
            ),
          ),
          AddPlayerFields(),
        ],
      ),
    );
  }
}
