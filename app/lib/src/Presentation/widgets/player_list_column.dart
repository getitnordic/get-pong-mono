import 'package:flutter/material.dart';

class PlayerListColumn extends StatefulWidget {
  const PlayerListColumn({Key? key}) : super(key: key);

  @override
  State<PlayerListColumn> createState() => _PlayerListColumnState();
}

class _PlayerListColumnState extends State<PlayerListColumn> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildCheckBox(),
    ]);
  }

  Widget buildCheckBox() => ListTile(
      onTap: () {
        setState(() {
          this.value = !value;
        });
      },
      leading: Checkbox(value: value, onChanged: (value) {}),
      title: Text('olof'
          // style: TextStyle(fontSize: 20, fontWeight: 'bold'),
          ));
}
