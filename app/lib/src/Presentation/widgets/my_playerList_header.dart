import 'package:flutter/material.dart';
import '../../../config/route/route.dart' as route;

class PlayerListHeader extends StatelessWidget {
  const PlayerListHeader({Key? key, required this.title, this.addButton})
      : super(key: key);
  final String title;
  final bool? addButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            addButton == true
                ? IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, route.playerListPage),
                    icon: Icon(Icons.person_add))
                : Text('')
          ],
        ),
      ),
    );
  }
}
