import 'package:flutter/material.dart';
import '../route/route.dart' as route;

class PlayerListHeader extends StatelessWidget {
  const PlayerListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select players'),
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, route.playerListPage),
                icon: Icon(Icons.person_add))
          ],
        ),
      ),
    );
  }
}
