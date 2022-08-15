import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../config/route/route.dart' as route;
import '../../../constants/color_constants.dart';

class PlayerListHeader extends StatelessWidget {
  const PlayerListHeader({Key? key, required this.title, this.addButton})
      : super(key: key);
  final String title;
  final bool? addButton;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 70,
      width: double.infinity,
      borderRadius: 15,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0.5,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.1),
            Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: ColorConstants.textColor),
            ),
            if (addButton == true)
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, route.playerListPage),
                icon: const Icon(Icons.person_add),
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              )
          ],
        ),
      ),
    );
  }
}
