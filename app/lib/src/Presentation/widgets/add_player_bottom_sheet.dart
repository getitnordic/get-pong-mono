import 'package:flutter/material.dart';

import '../../presentation/widgets/my_add_player_form.dart';

class AddPlayerBottomSheet extends StatelessWidget {
  const AddPlayerBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Add player',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
          AddPlayerFields(),
        ],
      ),
    );
  }
}
