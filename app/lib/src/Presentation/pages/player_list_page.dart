import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/widgets/widgets.dart';
import '../../../config/route/route.dart' as route;
import '../providers/my_providers.dart';

class PlayerListPage extends ConsumerWidget {
  final Object? arguments;

  const PlayerListPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> playerList = ref.watch(playerProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Player List'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
            SizedBox(height: 20),
            BigButton(title: 'Player Listttttttt'),
            SizedBox(height: 50),
            SmallButton(),
            SizedBox(height: 20),
            ColumnTitle(),
            MaterialButton(
              child: Text(
                'To profilepage',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.pushNamed(context, route.profilePage,
                  arguments: 1337),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ]),
        )

        // ignore: prefer_const_literals_to_create_immutables
        //       children: [PlayerListColumn()]),
        // ])),
        );
  }
}
